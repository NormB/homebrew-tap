class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.178"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.178/sipnab-0.5.178-aarch64-apple-darwin.tar.gz"
      sha256 "6a36eb42fab8b9b38e886e2de6d37fc13a47f4a724b372459b5ebbe0be5bc21e"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.178/sipnab-0.5.178-x86_64-apple-darwin.tar.gz"
      sha256 "7d842c43757802febd738c8bde1d9eba75b3004f2460d4e4d707d8002567d11d"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.178/sipnab-0.5.178-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0763fb6a14ebe26e35fc7d89abc70503a5e1d810cb6e0579fac0891939e54715"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.178/sipnab-0.5.178-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3b1de7472ae5bd82d7208f01038e36dae7dbdc3d349a6d08fc1dc3eb5712a4ae"
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
