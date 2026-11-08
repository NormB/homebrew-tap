class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.237"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.237/sipnab-0.5.237-aarch64-apple-darwin.tar.gz"
      sha256 "dafe3f848796daa600d8d9b1b2a8e4e742db64e53785008f747c477762ad94b7"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.237/sipnab-0.5.237-x86_64-apple-darwin.tar.gz"
      sha256 "40396b879b26494541742e5a53e3e2ee2ba58796854254028829529f7e06e132"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.237/sipnab-0.5.237-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1c63b0b27a4d04e039972e17f7ab872a1f9ce687bce0be40a63b79893a83f86e"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.237/sipnab-0.5.237-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "94bf6245821bd5dfaa232269f9ca1a9060cd8ba60d7db64c35c7c6c54db75f5e"
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
