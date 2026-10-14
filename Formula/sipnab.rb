class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.219"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.219/sipnab-0.5.219-aarch64-apple-darwin.tar.gz"
      sha256 "40b5103589c420ebb301a92a0491696890b8a85b34210374906a8a9c7b99c1bc"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.219/sipnab-0.5.219-x86_64-apple-darwin.tar.gz"
      sha256 "52f589ac424f3f2dc686c7450ccef6dced517c4749a5ff23fca9921d78d556eb"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.219/sipnab-0.5.219-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a36efd6d84d1d882e9a489972db52ca1b76bc2a335ac5bd77ff3082785d4c88c"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.219/sipnab-0.5.219-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0bbeb0b5519ef82e387f4316af544ecedf513de43432a05833b06fc83fd9a545"
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
