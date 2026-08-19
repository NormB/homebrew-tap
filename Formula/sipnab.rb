class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.113"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.113/sipnab-0.5.113-aarch64-apple-darwin.tar.gz"
      sha256 "8fdc49d410fb18945467fb9c28f0fe7e32d6cc4de2b65c1a10bde70c83729338"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.113/sipnab-0.5.113-x86_64-apple-darwin.tar.gz"
      sha256 "49ff8018aa6b3a6503c926f72ba1664b5494200e6153c376371d832312f3664f"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.113/sipnab-0.5.113-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3e6d6eb06751a00dbca397ed946b5f38168e9671bf2945b33096a8dd21ac49a9"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.113/sipnab-0.5.113-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8092c15de40a0d9d20ebe4ce85e8497470dd46104c1137a76a52e5f8a2e82a87"
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
