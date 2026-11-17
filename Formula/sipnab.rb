class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.261"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.261/sipnab-0.5.261-aarch64-apple-darwin.tar.gz"
      sha256 "82787ee0e32b20348cbd7e4b49a118128bfcd43d5a2d72e725f4cf5d74f6241b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.261/sipnab-0.5.261-x86_64-apple-darwin.tar.gz"
      sha256 "c7364ca88944d3f76f9999d26a97fef2c198c058a1ea60be45108f6890a6a122"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.261/sipnab-0.5.261-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a3082211c46507183e2443543751c613afa617abebdab04086780d6ebce3fd62"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.261/sipnab-0.5.261-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "872144e9d47c744082606375e9d5552b34f3b8adcb2ff9642ba66fa741888c58"
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
