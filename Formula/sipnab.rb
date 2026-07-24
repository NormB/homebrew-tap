class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.32"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.32/sipnab-0.5.32-aarch64-apple-darwin.tar.gz"
      sha256 "23e182ddc6b8e6d75356277661916b0b3d46c04c8eeb61fc064e6623863428e8"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.32/sipnab-0.5.32-x86_64-apple-darwin.tar.gz"
      sha256 "ff0e09162fbbbf704f2c68ef7390105dd56956deec020e013bb4f81ab0d00930"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.32/sipnab-0.5.32-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "86de287f3537849f053ff42c0e8a3f5d74fbe5f2c545b4c50f362f8b8f312158"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.32/sipnab-0.5.32-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e080f8318e26c0333ecfef9de960f3f012877f1c1512ca5e207de4910af54d7b"
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
