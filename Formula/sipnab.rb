class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.12"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.12/sipnab-0.5.12-aarch64-apple-darwin.tar.gz"
      sha256 "cdbbd430384c65f73fdd6532eaeee74e334de1b7e2bf5244ccd13a7ec88cf637"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.12/sipnab-0.5.12-x86_64-apple-darwin.tar.gz"
      sha256 "121ef087a38f5d4a3208e32107a1aa30ff8a9d0a0c01e2cb3715a6a0d18a6a3b"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.12/sipnab-0.5.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6a042a83909969bae1f4b0f99787ceb78fc874069d2ca3e84052e13abb88491a"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.12/sipnab-0.5.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c1566fcffa8e17da721d62fa955758abf4bb904607a881bfc00f863770ed7131"
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
