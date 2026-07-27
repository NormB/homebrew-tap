class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.45"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.45/sipnab-0.5.45-aarch64-apple-darwin.tar.gz"
      sha256 "987bdcf35aa85f16b3fbb805fa4e528357b3a2beb5b8c70f4b9e0b4738270729"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.45/sipnab-0.5.45-x86_64-apple-darwin.tar.gz"
      sha256 "546ac118f0d939239676a5dd7481a4a6dc3c59af93c3d6dc2b2165f193da0bd8"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.45/sipnab-0.5.45-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "71e0efb85232895b769a86d98da95a7e95477cabb90be1b6b466eba24e7ee10d"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.45/sipnab-0.5.45-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "88395101ea28de1a3834feca9eae65466f5c8e1e5ad9430be1b7d5a1646cc98a"
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
