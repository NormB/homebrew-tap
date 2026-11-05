class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.234"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.234/sipnab-0.5.234-aarch64-apple-darwin.tar.gz"
      sha256 "721379f9f2376cd6796c5d6c7055e687165826a96b8fa8e78e18a875e7aa8f45"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.234/sipnab-0.5.234-x86_64-apple-darwin.tar.gz"
      sha256 "0d51fcebdd14f45a62781229269542cecbe6adafdbd8a3347a33f443981ad075"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.234/sipnab-0.5.234-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "135e1454944cd1aba5c9296b1c15892b12ad406eb4bee655beafbb275c665164"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.234/sipnab-0.5.234-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e49c32d7cdee830982fbabd82390f8d5325ffa2cddbdd925de811633bf4dabe"
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
