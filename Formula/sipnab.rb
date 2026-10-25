class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.230"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.230/sipnab-0.5.230-aarch64-apple-darwin.tar.gz"
      sha256 "5373744d2e25a6e0dcb873e882a4bcb4710840672b4116d2a70faeeb28359bbd"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.230/sipnab-0.5.230-x86_64-apple-darwin.tar.gz"
      sha256 "90dcab3c9258cff57f9ee4b6e3336c6d06e311c281d138ec16525e29b6735ac3"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.230/sipnab-0.5.230-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "494df4bd79db1b9050386835be536ebc209d22f056037a9d1be2a0f6900ae0ae"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.230/sipnab-0.5.230-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f507bbf378c365241031c1a9df54dbe6cfabdaf1ba32890f299d3d79357c25b7"
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
