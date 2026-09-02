class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.144"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.144/sipnab-0.5.144-aarch64-apple-darwin.tar.gz"
      sha256 "93b8c420287ab4b947f5925937b0351b6757c51f6d4b3a667ab80907ef5d02cd"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.144/sipnab-0.5.144-x86_64-apple-darwin.tar.gz"
      sha256 "fbacf579e03fb54ac84aa387dbe99ecd73d4bddb47576fb444ca748e80987f4d"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.144/sipnab-0.5.144-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eb54a54da73cdd90e4b3a964081a090603377ec51055781d2321842c823bf0fa"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.144/sipnab-0.5.144-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "139d37f17d4aab1b41c9d762149fde37ae76f97f0dd192741110d1b46001b630"
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
