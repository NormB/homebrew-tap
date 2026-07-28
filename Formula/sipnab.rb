class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.54"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.54/sipnab-0.5.54-aarch64-apple-darwin.tar.gz"
      sha256 "cbe24782c376b8c843075e761b105c25f46b210e18e4c837b6c984f2fc9930cc"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.54/sipnab-0.5.54-x86_64-apple-darwin.tar.gz"
      sha256 "58e57e47ec136a33c0cdbb83c3a0fe92b6d61af0daad57316bd10e13d7a3b91b"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.54/sipnab-0.5.54-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dda0e41ace24afcc19d035d824173dd315f3e2d93a858cd9d198d4b6782bfdd5"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.54/sipnab-0.5.54-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "269d6137c132d09220e3b133f67cf104fb3e8ceec2d8d71083941dada730ea6c"
    end
  end

  def install
    bin.install "sipnab"
    man1.install "sipnab.1"
  end

  test do
    assert_match "sipnab", shell_output("#{bin}/sipnab --version")
  end
end
