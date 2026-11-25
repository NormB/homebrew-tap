class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.273"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.273/sipnab-0.5.273-aarch64-apple-darwin.tar.gz"
      sha256 "08c26ec37f15a430e3f04f0bbf8c6b2cfdd8011eb4a8b3ead3d7a49248d8e020"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.273/sipnab-0.5.273-x86_64-apple-darwin.tar.gz"
      sha256 "16a3e9a5f649ffef8fe81159fb2ad6bbba9b723062fc6e3f25e533acbbe25728"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.273/sipnab-0.5.273-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c2f4b021bde07de467360c3b0bd2bc051b3ac0165792a382fd33d8701cec0e4b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.273/sipnab-0.5.273-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "db8f6124b7ecca1f1aa03014072c3b7329823ac89e76c0efbc4ae9e790022da3"
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
