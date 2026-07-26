class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.40"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.40/sipnab-0.5.40-aarch64-apple-darwin.tar.gz"
      sha256 "c989d80f6cb3d97d475c3dcd540d0bcacf56cb28eca7dd8301b8a45d4a0afba9"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.40/sipnab-0.5.40-x86_64-apple-darwin.tar.gz"
      sha256 "8abb05cff62983148e5f2cfb19605741aae7ec7d850c266eba40adf26de714ed"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.40/sipnab-0.5.40-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a16957f5de5e2e056aed05cc7385bc013a3d61f4b28c58a45616f4a95d88ad75"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.40/sipnab-0.5.40-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2b81e13d004042807f6f28392b0728b56f793bbe7ec98426ffd5562b9e41a18b"
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
