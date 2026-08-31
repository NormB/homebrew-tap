class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.138"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.138/sipnab-0.5.138-aarch64-apple-darwin.tar.gz"
      sha256 "d5b374c1c18195df6ad6a209baf0dcf718640d929a7ddea3736ef7c450d83da9"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.138/sipnab-0.5.138-x86_64-apple-darwin.tar.gz"
      sha256 "c80c33ae91a2b83fb4eeff3f541239a0a27f1df45343f6643eb476192f2e1e5b"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.138/sipnab-0.5.138-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "964b1d1fc39aa93fcbde3af7aba9711746ec5e2e0827b7d8c1779f8f8f3c1f23"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.138/sipnab-0.5.138-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5ca65bc0727a7289108b84d274fbd4e686ab47eca6c37e3b78bf977b8be890f2"
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
