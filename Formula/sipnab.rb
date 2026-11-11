class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.245"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.245/sipnab-0.5.245-aarch64-apple-darwin.tar.gz"
      sha256 "df65c8594bf4f716b43aca48ae3f48457d1cab4595a4f076a9695080f18d8d25"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.245/sipnab-0.5.245-x86_64-apple-darwin.tar.gz"
      sha256 "9726ff2e377561bcc3dbb6f6183a594987179250b51f4643dceb9caee16e93b6"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.245/sipnab-0.5.245-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7a1dd90024831b11087d9172a2926c2c0155178384f3a5565032eecb8aad7945"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.245/sipnab-0.5.245-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2ce273df7b64d24264c421eec3e0c05a239fd611b807f862a7afc057bf5a010a"
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
