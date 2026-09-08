class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.158"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.158/sipnab-0.5.158-aarch64-apple-darwin.tar.gz"
      sha256 "776171b392025af495fa80d9c85154a7dd6477dd33c470c156362a62ebd2e094"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.158/sipnab-0.5.158-x86_64-apple-darwin.tar.gz"
      sha256 "9c6fd67eba2560bcfe5b8bbecb6d3b64367987bc1bf95a6bdb9dea1fe891c46e"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.158/sipnab-0.5.158-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7de6cfe77f3bd50676fd019e18ece7c78cd5b84c1df7d2c9ca936b7a6bb672bc"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.158/sipnab-0.5.158-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d4bbde7c0970bfa1beccad7a3c44bbd831f2827298112a94652dfbad21fcbcea"
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
