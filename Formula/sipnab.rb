class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.208"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.208/sipnab-0.5.208-aarch64-apple-darwin.tar.gz"
      sha256 "77fe685f21f0b30d1ae2d049b495d38e6df2576cd0fc6b5d9a690a43ef099480"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.208/sipnab-0.5.208-x86_64-apple-darwin.tar.gz"
      sha256 "78ac8b0c9e61180f4333e2d1f6355ee2bc21b1df81d04881a529b59d128381d9"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.208/sipnab-0.5.208-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9eb227e4839f0efd59d1bc87efc57fa258c081e4dcd3f791ff09d738de1db014"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.208/sipnab-0.5.208-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e1bec30944c675b45ff627b6e0fbb5ec823f3f89c4a9a52f591dedfbfce8d1f1"
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
