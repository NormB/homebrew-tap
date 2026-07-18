class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.14"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.14/sipnab-0.5.14-aarch64-apple-darwin.tar.gz"
      sha256 "8fd83088e7b5b3e6e6ef684926b4db86d7d1b63a59f340aa90d65e85ffa1a8f8"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.14/sipnab-0.5.14-x86_64-apple-darwin.tar.gz"
      sha256 "efb30ffeb19827a0a26f7df37ebf222d9e0721afc61e1f8d54f9ae19f4c6101c"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.14/sipnab-0.5.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1a885f1558bb51f3ee65ceba5a13b286fdb4d444b537963b01c270ef8be1e4a9"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.14/sipnab-0.5.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "30ffb8c748553659645a2084b37ecfb1a2962fcdf77ab7e2c72e3ba1cb9f8e88"
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
