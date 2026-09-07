class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.155"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.155/sipnab-0.5.155-aarch64-apple-darwin.tar.gz"
      sha256 "011be8de42d228931be2c8c2f0686cd2f51c7762b878d25bc13f01aa43fb84e7"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.155/sipnab-0.5.155-x86_64-apple-darwin.tar.gz"
      sha256 "2514b752210b275ae04abe5481b5d612515bcb6b8b2eeaedc91424efb4619f2d"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.155/sipnab-0.5.155-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d5aa2a877e782f04d8a49e4ee1038589845831604b95230fea56bde8f4c4a699"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.155/sipnab-0.5.155-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "209ea9d663ca2091c329c7f32351d55bf8940cbbdd97029cdeb77ac29f27e695"
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
