class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.204"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.204/sipnab-0.5.204-aarch64-apple-darwin.tar.gz"
      sha256 "922e66b0decacd35b04d067014519eb1d1337ca7db550e40f5f8cadbea7131e7"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.204/sipnab-0.5.204-x86_64-apple-darwin.tar.gz"
      sha256 "1a1aecf2ac441f03dc523e14540a8927bd8dfdff5bbee981c0bf4a442000d962"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.204/sipnab-0.5.204-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "43c3587187983b1c2e0e72a99174fbc5cbf33fb537c3ce8e0d26a5da5453ca23"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.204/sipnab-0.5.204-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cd6ab13852f8fd6f8b104e90e4da831fc1b68a1c004304395f35f0c5ec0e2c1c"
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
