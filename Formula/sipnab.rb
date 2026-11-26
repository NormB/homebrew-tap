class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.275"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.275/sipnab-0.5.275-aarch64-apple-darwin.tar.gz"
      sha256 "c952724899293d597d50104535ab9ba5d56283314708a38ecf31a33a0b46d52b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.275/sipnab-0.5.275-x86_64-apple-darwin.tar.gz"
      sha256 "849c87edc13dcc5e9c424aebce96fbedbb7901361dd35772d2142b5c9702b439"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.275/sipnab-0.5.275-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4f7423fc0d1c1aaff6635941651b2aee40b509ed6212691e31f81f26af18467b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.275/sipnab-0.5.275-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e48f4f0bd90569c3f88d4cbebb067e46939c60e1d1dcb193cc530225dda414c"
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
