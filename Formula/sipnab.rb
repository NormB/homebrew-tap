class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.88"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.88/sipnab-0.5.88-aarch64-apple-darwin.tar.gz"
      sha256 "d8fe161a4061e0e49fd81d3c528c71b51b6189b995fff214ddd2c33d0d708259"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.88/sipnab-0.5.88-x86_64-apple-darwin.tar.gz"
      sha256 "5fb0ef1ab8cedeb920f3d9c97082972143a34c2bdaddaa116be26b7284d9dbb0"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.88/sipnab-0.5.88-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "17028e4dfe55336b8a61deb98c9c769721838fe2b65b37195ff9c7b4fadd3649"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.88/sipnab-0.5.88-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e63a8c5a777465fb17fd94750c1dc944e56d1282010ff810846aa0ecc97a5e9a"
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
