class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.173"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.173/sipnab-0.5.173-aarch64-apple-darwin.tar.gz"
      sha256 "0d6fe0520eee5b68b621cba60eb7d14ec385c939de462a243d3f45aad29657e4"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.173/sipnab-0.5.173-x86_64-apple-darwin.tar.gz"
      sha256 "0a43cf2c2d58185b189b585d55928197e36cc78233055a125732798bcb96c0e1"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.173/sipnab-0.5.173-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b7a575a87c0f52ac6f040f2fe41d307154449b74a1ab74ae22f200102663f193"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.173/sipnab-0.5.173-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1b2917a6698a98dca9a5d4978715033cbba8c6edf3163c733de0521f464bee11"
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
