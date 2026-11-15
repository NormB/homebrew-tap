class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.257"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.257/sipnab-0.5.257-aarch64-apple-darwin.tar.gz"
      sha256 "8dcd202d5e21d72bd9bf1c22d13c83d7fb5d787903609f15feba3eb6c397b98a"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.257/sipnab-0.5.257-x86_64-apple-darwin.tar.gz"
      sha256 "14fbae7307cc96adf73e5a142514a18c08795b84abacb0a0ef97da8a48dd3978"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.257/sipnab-0.5.257-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d4fb6549300ce6247ccc84be4fe140746a296ba02888a37fd58022afb07bc492"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.257/sipnab-0.5.257-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ca856e2d08d966c47fc9af5591a3c30a18cad2eacfd4315ac25d6f3cf50ac460"
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
