class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.203"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.203/sipnab-0.5.203-aarch64-apple-darwin.tar.gz"
      sha256 "18d0b1ef9731bd1c10287509235efe58d8c7a102cb4eabf0954d2fd6178abf23"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.203/sipnab-0.5.203-x86_64-apple-darwin.tar.gz"
      sha256 "4822edfa34de2f6bf050226a5fe1f14e29853626a2e37f86d2d406fa5403c812"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.203/sipnab-0.5.203-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c7b9574cef2f934c465eb586eaa3bcf8ef8eea5100e8880df2f45c607ab6ef94"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.203/sipnab-0.5.203-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0181c9107614da260010d2fb62e27c27df8715698df71f9120bcdeef67917d5d"
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
