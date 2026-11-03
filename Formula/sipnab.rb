class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.232"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.232/sipnab-0.5.232-aarch64-apple-darwin.tar.gz"
      sha256 "0452c2a0643ad63b94193f88c8aafe9b3eb582aad8a97b0a7a2bcc69432f9fd1"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.232/sipnab-0.5.232-x86_64-apple-darwin.tar.gz"
      sha256 "4e4fa86cb6a784cfbf776c10bdc63630edda33a7c42528c30c44e0023a71ead0"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.232/sipnab-0.5.232-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "10f89d1b86d83f5fe6cff2a73ce8e022b6f21e43aaed1512e7594b4004b8480b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.232/sipnab-0.5.232-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dce28fc795ba7e05aa948ffb478f59c5be214d8d548bfc6f332782a3f6c49d4d"
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
