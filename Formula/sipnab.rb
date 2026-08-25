class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.125"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.125/sipnab-0.5.125-aarch64-apple-darwin.tar.gz"
      sha256 "ff10578d6876f7cb8dbcb31110892a96126d447cc5e0debb7405151022841c13"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.125/sipnab-0.5.125-x86_64-apple-darwin.tar.gz"
      sha256 "6a299c71019afb9ae391337d58d739e6c6915ecf5b02ce4f44569eac52aa414d"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.125/sipnab-0.5.125-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8b245591140da62fe7b7f1ba225786982938db82b3ef406318172235731980ff"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.125/sipnab-0.5.125-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f51f52bf4a87736cd88f72d06adc45da45ee0d7ebaf6376906062b1bcbfd9c0f"
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
