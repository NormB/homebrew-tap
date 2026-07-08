class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.1"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.1/sipnab-0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "7f53ece66816a13ba3e32d8f7f091755a5d242fa2205dfa0c4e829dea84c9c38"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.1/sipnab-0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "02d803f0c7db2640d09c7cd3dd4c0cf2249d7bb4c4bec3f6129c4de1393664c9"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.1/sipnab-0.5.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c96bb740de18b16b729dc4ca8006468770db035b5205317a170efe3f002b6c34"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.1/sipnab-0.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cfd7fb46793201b3c293de3587b70dc86c183fce8b8d3d31b5ab7b04adf05271"
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
