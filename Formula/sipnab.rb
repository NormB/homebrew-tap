class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.242"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.242/sipnab-0.5.242-aarch64-apple-darwin.tar.gz"
      sha256 "e8d1e0ce9455fc09494c4960d267477bf5d26e8c50bb545811af952928948d8b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.242/sipnab-0.5.242-x86_64-apple-darwin.tar.gz"
      sha256 "476c086b72bb7c464bd06a4b45afdb034b45f1fd354f85fce32e66e51cc8c4de"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.242/sipnab-0.5.242-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c85aa38604d59f2c4d8b0ac7e153abfd9ab6fdb5955a7dd1b7d07a72821b9cbb"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.242/sipnab-0.5.242-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "acdbf3cb037c4f5d4d1b247aa4be3c6109d4483852ef1dc9480ce5a0fca291aa"
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
