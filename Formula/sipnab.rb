class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.207"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.207/sipnab-0.5.207-aarch64-apple-darwin.tar.gz"
      sha256 "2084a5e803b8b238d3e973a8867c43a76d96b04c7bef8f0def34e5b4288ee3ad"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.207/sipnab-0.5.207-x86_64-apple-darwin.tar.gz"
      sha256 "3e940c5dadc3817f51b579604e5e4f627089fa2aee1d69f7220b1cf6589b289b"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.207/sipnab-0.5.207-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "66ec15643697ce9320586c02297c2b8592e55317b39ada1ad78a14696b7ddfa8"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.207/sipnab-0.5.207-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "68a7c469c1eabecb9611d868ac1460e9219c41ea085b26b31d9709cbf7857193"
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
