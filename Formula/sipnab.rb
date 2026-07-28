class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.56"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.56/sipnab-0.5.56-aarch64-apple-darwin.tar.gz"
      sha256 "3d681dfb5ec668c9178a9717555eafa2ea91fc4bf51d3653bbffd016e7e14f18"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.56/sipnab-0.5.56-x86_64-apple-darwin.tar.gz"
      sha256 "85262d62fb853edfb8970bf907d79d1284fcc312e05f266206c043d4bd3e4053"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.56/sipnab-0.5.56-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8be621c81133452fa54c5b2825d0b9af6c595698ac98b639d429c565fd6ece92"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.56/sipnab-0.5.56-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ddd80607f1f02255ca9a08f34ea2814c90623c8bf52e8baf673f66609348dcb2"
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
