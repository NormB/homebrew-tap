class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.20"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.20/sipnab-0.5.20-aarch64-apple-darwin.tar.gz"
      sha256 "d63b7b519a2d94c9a80a9f0f816cbe4fa8df18df08440b188aa9cef74260d356"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.20/sipnab-0.5.20-x86_64-apple-darwin.tar.gz"
      sha256 "233e04aa10c48962ec3b1ed2965554bef4ab99960e2b35286171cc3e6e45783a"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.20/sipnab-0.5.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6cac5bf5487b694142f85892b98a15ce93f5185cf0046c272f0d66c8b6f654a4"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.20/sipnab-0.5.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e44f338a63d1a3b223a3932a887cbb01fd0e831303a0c5957b0ac5b5a46a248"
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
