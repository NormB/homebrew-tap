class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.83"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.83/sipnab-0.5.83-aarch64-apple-darwin.tar.gz"
      sha256 "939f7c42c798046c823fe1e34c212604fbe2afbc5be71bf825751bcf73d0ec78"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.83/sipnab-0.5.83-x86_64-apple-darwin.tar.gz"
      sha256 "85c23a661ae0b093be6de2c6d285ec93b5d88b27b61158e2de20f46447377f26"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.83/sipnab-0.5.83-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "49655dedac52e2d92b34f935b4b99452b506195f2024b4d38382a4cec6eb93cd"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.83/sipnab-0.5.83-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b3769567fd7b0482571a0f228a77116166c732a5d5b312c585d7c9ea68564ebf"
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
