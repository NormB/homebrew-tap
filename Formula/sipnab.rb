class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.122"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.122/sipnab-0.5.122-aarch64-apple-darwin.tar.gz"
      sha256 "aaa4d359c08f1444502bf1e1faaea4f02627a1e35477810594b6b4102d1cb6e7"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.122/sipnab-0.5.122-x86_64-apple-darwin.tar.gz"
      sha256 "3ed061576291dc4593bf6bb98396c72751c154b53023aeb865b959b0e91ea980"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.122/sipnab-0.5.122-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "12cf01c7d1e76f193b8bdf85def17ba58a3b6d01408b83d79f1b0ccb327cadc3"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.122/sipnab-0.5.122-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7833c5209f5adc87d9cdc543dc336492859d7d11714ab9d31ec4466b63df44d0"
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
