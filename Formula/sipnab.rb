class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.8"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.8/sipnab-0.5.8-aarch64-apple-darwin.tar.gz"
      sha256 "a41852634cd8e49bd7a560e4e33ba84f2d26432b0a8d3d729a69d3744705ab74"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.8/sipnab-0.5.8-x86_64-apple-darwin.tar.gz"
      sha256 "021886f09a0ac99c0fc651351789bf85e5064a16e7cfa0db3b77294fd7ebeb8f"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.8/sipnab-0.5.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a59d7c75bff9ef25a5ed5d047ddc935245a3d0c836f6115ffc542e01eb70a99d"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.8/sipnab-0.5.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "86ac7c1fe0e7694e7986451e42f0ccea6b55af05741a04005dd9b5baffd80d06"
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
