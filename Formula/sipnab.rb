class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.109"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.109/sipnab-0.5.109-aarch64-apple-darwin.tar.gz"
      sha256 "0639f79cefa8ead07e584138f5a5be5cdcf8fff69a4f6019ec2e36b0d113fc1e"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.109/sipnab-0.5.109-x86_64-apple-darwin.tar.gz"
      sha256 "4afd543f08e014f3d6c1524594ffbcd2e8b51ea8746815167663c7658df0af3e"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.109/sipnab-0.5.109-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "322d16b24a45ba5e4b971a59c81be3837bb37af61991b0f78f83ed12196732ce"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.109/sipnab-0.5.109-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e5f0b8d0deaa230af0721a45a8d81d776820fe870bc7948663590c25f8caafdd"
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
