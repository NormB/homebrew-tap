class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.209"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.209/sipnab-0.5.209-aarch64-apple-darwin.tar.gz"
      sha256 "e5f862d06e541d9e1fdf3f5a1b23d14933d99dacea61bcd631287dd5af380529"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.209/sipnab-0.5.209-x86_64-apple-darwin.tar.gz"
      sha256 "7022c7920f6767136729ed6f4cffbc2dde7021ad2f3addedc233e4fbe36d35ac"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.209/sipnab-0.5.209-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "85b9449d3d55b6d5953adeb194a2891109c722e224975b942c18e2c73d2916af"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.209/sipnab-0.5.209-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b3b39998c83659e8555ffd672588b3102304bd8ca6f888b4a5748d68eb7094ac"
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
