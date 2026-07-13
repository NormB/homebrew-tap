class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.5"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.5/sipnab-0.5.5-aarch64-apple-darwin.tar.gz"
      sha256 "a124abf3c331d2c21dd599c72dd42840fff954839179f7823b76bfcf51cdc826"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.5/sipnab-0.5.5-x86_64-apple-darwin.tar.gz"
      sha256 "ce6496f99bb0e08c2bae361a607f68c0e12c28be0bec372bb32b16992cfc385b"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.5/sipnab-0.5.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1463ac5e4538e78ab9b1499376b9f290139e19bd0c2ae22f78316149929980fd"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.5/sipnab-0.5.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f4276805ab242ee918310d6f90cadd8f6b7ef4297a19d52f46a354c9c400d53c"
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
