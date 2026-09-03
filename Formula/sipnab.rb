class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.149"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.149/sipnab-0.5.149-aarch64-apple-darwin.tar.gz"
      sha256 "c146a00dbf904261a23168b950a219c7413c5be418820ddbc92d3f9160143fdd"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.149/sipnab-0.5.149-x86_64-apple-darwin.tar.gz"
      sha256 "b00c2dbf7b416b69cbdcf01a2bd78c906e6dec0e8c4d29c981de61dd9928fecd"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.149/sipnab-0.5.149-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cdbf0294af5bab9f69b417bddfb2128bb478b9c4b911c034ddcdc6ab0bf2ea5b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.149/sipnab-0.5.149-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d95d8660770129e99e049b4efc5ee5bac0a20c9179141026a8de9e45b803181b"
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
