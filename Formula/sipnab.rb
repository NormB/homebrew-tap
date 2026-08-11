class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.93"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.93/sipnab-0.5.93-aarch64-apple-darwin.tar.gz"
      sha256 "035094b4821c0d1723c8c987828ac4949ca2a404473cc4670b8e9c29fe6ccd9f"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.93/sipnab-0.5.93-x86_64-apple-darwin.tar.gz"
      sha256 "533e6caf52e73c16c6c031d6403609449a94cc2b8f5efe46c05f881c21877498"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.93/sipnab-0.5.93-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "57a75770588759cbd44908484609b6b20ed2f9a037a06a66c27bbfcb625f852d"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.93/sipnab-0.5.93-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "524dd1b79945437d5e90d84cfa4b898dbced00d64ab007d39539583ad9a4ac9c"
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
