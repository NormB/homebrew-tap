class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.47"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.47/sipnab-0.5.47-aarch64-apple-darwin.tar.gz"
      sha256 "e9f8bd1bec746fa82f935f75d2ce084b61491f3765f643b1f56b9c4e9d2b0950"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.47/sipnab-0.5.47-x86_64-apple-darwin.tar.gz"
      sha256 "be507c576aa67e409fabbce158f57ec82abb25c64284edd7f14f4303922bee4c"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.47/sipnab-0.5.47-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ddc1558d5d5de9298c053c030f3a4f924e9b213dbb507f0043d82b77366122de"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.47/sipnab-0.5.47-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9173ccea04c34eb0e537377f57d2ef89a493f7578a50074c00049f1fe81c15a0"
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
