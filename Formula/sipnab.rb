class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.152"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.152/sipnab-0.5.152-aarch64-apple-darwin.tar.gz"
      sha256 "1637c7013b1662ff79293f14a32ddc16f98ea478c7964f446c7ae4a6313627a3"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.152/sipnab-0.5.152-x86_64-apple-darwin.tar.gz"
      sha256 "2aabcf8cc382f8eeca40645717a0cf1f9261bb0d6f188c13cd18ddcebab2d971"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.152/sipnab-0.5.152-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4479b46858b7ebdfac6e58e484418ff1fc9f0e80a1b30f00df12994442d3d152"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.152/sipnab-0.5.152-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "76f647790b87e269146ff5a0629b49b60c0b9874291a372629ed67c63c88a0d6"
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
