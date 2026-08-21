class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.119"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.119/sipnab-0.5.119-aarch64-apple-darwin.tar.gz"
      sha256 "8330b403d68c6fad03eec9853ba36ed6d5bf413d4104d259c836a12b0df14fd9"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.119/sipnab-0.5.119-x86_64-apple-darwin.tar.gz"
      sha256 "7c252ae4db0a1a3de1f8bc627a5073d4938597a907eae3d9c9032d75b8dcb956"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.119/sipnab-0.5.119-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "69f9dd76df6b1fe2da7a2a3bb6f3510ff9210788a07f3c42b9af5499044163c1"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.119/sipnab-0.5.119-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1e422637fa268bf44d9d35f801b10a262ba3f49f18bc053f8544ac6d1719fd6b"
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
