class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.167"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.167/sipnab-0.5.167-aarch64-apple-darwin.tar.gz"
      sha256 "32577955d88976cc28ddd8eb8af268cc9816906224db9cec778d0cb5dfc314bb"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.167/sipnab-0.5.167-x86_64-apple-darwin.tar.gz"
      sha256 "6924ae063cae69bc1c727b64fde273b5ba69d019d5c448d3a2a632cdf816c240"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.167/sipnab-0.5.167-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0d7fed486e694540a10b2fe70e7c06fcaf44b74e4d216a08baed78166bf42c8f"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.167/sipnab-0.5.167-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d1e62d0f7d4adc8212393607ea96dfdcad1fd5d740811a013d2336881b545994"
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
