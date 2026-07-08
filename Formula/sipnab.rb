class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.2"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.2/sipnab-0.5.2-aarch64-apple-darwin.tar.gz"
      sha256 "db888800cc614fdc2756033f6cb845202a14ad81cbbdc035e4495e25b00ff784"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.2/sipnab-0.5.2-x86_64-apple-darwin.tar.gz"
      sha256 "f7ce38e35b2d772f8a7267a46142f1d796bc06a3529edc11fbe7393bcdd08280"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.2/sipnab-0.5.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "849ecf9ce31130aedfa076a09fb3eb4a3e62c4b8969e3f5243d9710ff9b4bb68"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.2/sipnab-0.5.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c3c9caa18ec39676ced81310b76ca2154d2e9450364b88f3bcbb212177a38b0"
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
