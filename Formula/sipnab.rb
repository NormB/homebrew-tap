class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.141"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.141/sipnab-0.5.141-aarch64-apple-darwin.tar.gz"
      sha256 "9ce50f91595aac684534bd04a0b6aab6fcc5e575befa96d3e973e276b09b6438"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.141/sipnab-0.5.141-x86_64-apple-darwin.tar.gz"
      sha256 "49701dafe094f6fd4acfbe5897c1d801f238b03e1c6434ea1d37100b77321c43"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.141/sipnab-0.5.141-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d9bdbb641d2f7954ad8697b347e02bc5b54c82242a36f0b1fbf0426bd0915dde"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.141/sipnab-0.5.141-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "727337aeccb6d40039f7f2f69de5996270abae3425bc39d65627c525277c34bd"
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
