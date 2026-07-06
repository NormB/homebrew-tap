class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.0/sipnab-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "15e5405b8d3a0330ddb32c0329c67aeac052b93b07585ba4971ef62156d1e500"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.0/sipnab-0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "9201c2ca78ac776ebad5fe189cbd1ad5539ba57347ed0b5b58003de94343eccd"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.0/sipnab-0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "124c6f95511e32dc88ade7434b4df7548c02a9f5f14794c1f96579ffa153a790"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.0/sipnab-0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7fd3ae622fbfe6a554e22ea95875f1b1d619b43b5a51bb50b8328bb977e88c1b"
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
