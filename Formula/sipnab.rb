class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.220"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.220/sipnab-0.5.220-aarch64-apple-darwin.tar.gz"
      sha256 "aed7655ac363c3fa0d9b17f669e51a4ff408bef6dc0c6fe6daf104ac1b8f87d5"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.220/sipnab-0.5.220-x86_64-apple-darwin.tar.gz"
      sha256 "6b4a7879f0393acf82def53504e05692b03c6af2af1041ae7dd1581782028cde"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.220/sipnab-0.5.220-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f61bf388e5a430882e2aa711bc32d17f1d721bb1706378a854616f7bf3cd23d4"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.220/sipnab-0.5.220-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "50a3f20d7319f1f767e3eefdf9e3a5d9b05f89efe4a951a70e234d9053f75faa"
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
