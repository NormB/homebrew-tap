class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.169"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.169/sipnab-0.5.169-aarch64-apple-darwin.tar.gz"
      sha256 "7259ff0ae0c5a713c9b3770285cd4fcc80aaa1f0cf49fa3f436358be38990c90"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.169/sipnab-0.5.169-x86_64-apple-darwin.tar.gz"
      sha256 "4ef1dc1a4a12c9379ab54cfd502aea40e1ef9d1c9eac6fe6caae6a713dcb0b43"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.169/sipnab-0.5.169-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "292f3029c6c4c19b02981905f7cdfc9ed4a54f09e9f7da9a274811f1e730d521"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.169/sipnab-0.5.169-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1d3fd3dfdbf6e5399c44886bee16fa239719f13ee0921ccc881d90f83d1a6b47"
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
