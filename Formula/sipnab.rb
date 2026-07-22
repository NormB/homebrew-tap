class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.25"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.25/sipnab-0.5.25-aarch64-apple-darwin.tar.gz"
      sha256 "7c8d72abece624657b158d14fc62362591713cad9773a5689de159c86ce75eca"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.25/sipnab-0.5.25-x86_64-apple-darwin.tar.gz"
      sha256 "40da81d6867f0789e5b261a93465474c8e76f5f5f7b5c14274a782d01f1b2bd4"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.25/sipnab-0.5.25-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bf342d71c38272a9c538d0a934c6bc46f6d468939afed2a5884efadb9c7e7658"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.25/sipnab-0.5.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "182c53220e24dfc0190024edc3ffead669186920e877ebb77eeedf5af607f8fb"
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
