class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.78"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.78/sipnab-0.5.78-aarch64-apple-darwin.tar.gz"
      sha256 "2c558cc5d54f1beb844a009342f87d65da7c7bf13ea837813c1c4d3b9140a04f"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.78/sipnab-0.5.78-x86_64-apple-darwin.tar.gz"
      sha256 "907f2ad3fc9d03323bcd72720a6ae3ce19297cbbbb8065a3cfdf474bd16d69d4"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.78/sipnab-0.5.78-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "626cd30b1ccbb648c370d20d52e26245a7532de7e37460eeb84c471e2767523a"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.78/sipnab-0.5.78-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "17826555b5d00ad0771138376aa5acdfdcd801e2f6e79d70934d6d7f39d4079d"
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
