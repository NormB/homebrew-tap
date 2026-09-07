class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.157"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.157/sipnab-0.5.157-aarch64-apple-darwin.tar.gz"
      sha256 "9867f7bf976429f2e95849a30d46fb050ce2851bfbb0313d7395c337360394a6"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.157/sipnab-0.5.157-x86_64-apple-darwin.tar.gz"
      sha256 "be8268f6e64fea647ab42e5cdd2cdf0a85dd14d5cacf2119de217d3cfa9a53a4"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.157/sipnab-0.5.157-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "985d38eb36661198f2127a6fdcc484dea33aa6a39033794223b694814e204f90"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.157/sipnab-0.5.157-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c96c0243765b29b1d9299505293ede0455211509906ff1747923c24ae8680410"
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
