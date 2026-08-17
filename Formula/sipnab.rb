class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.108"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.108/sipnab-0.5.108-aarch64-apple-darwin.tar.gz"
      sha256 "8879d33a4d59d80feb4a0aa27b1a1939806bbdaf514a1f6777951f3020127992"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.108/sipnab-0.5.108-x86_64-apple-darwin.tar.gz"
      sha256 "4edc87f9c043abddad3c15937546f08bf308b602b77ebc26a9d20c37059ac0e3"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.108/sipnab-0.5.108-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2cfa3a0e5cef481ed1a1a2606c8d40369826815d255303ff807fbe5ff224527a"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.108/sipnab-0.5.108-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "12ceb0159c6eb09481ae69b0acb21e55296f52ea73f6711b889093d2ab3b74b4"
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
