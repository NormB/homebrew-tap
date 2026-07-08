class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.0/sipnab-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "e3f2bbd101f38e2e09ac1023f29714d816cedb24b6e348f5c919bbe9fb2c4316"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.0/sipnab-0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "829ecec030fecc8e1c0d9cb907d6a3370e123a86544a3403c5a25fd3ebc4c5d2"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.0/sipnab-0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d296d3232f6995dbae8a9cd2045f81e09b23d2e2326c1fa208b213b19f63c78d"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.0/sipnab-0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4b0637cb66a34901208e93abe3645b4c36c04d8e8782e3b5dfd04ee5d37e79f7"
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
