class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.151"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.151/sipnab-0.5.151-aarch64-apple-darwin.tar.gz"
      sha256 "ceba9b56ff3d0ebc59afb5d42988e8540ebbd552ff022dc6a5ea51230409a513"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.151/sipnab-0.5.151-x86_64-apple-darwin.tar.gz"
      sha256 "27bed0d405a3efa252725a28095338c076eb4e25d354aec64580722a19770503"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.151/sipnab-0.5.151-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "275733d116362f907cee5a94b465c5510d1f35b4e2dafb11fef14273846a6b92"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.151/sipnab-0.5.151-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "51489cf68a21b97fe18a5d4fa1a96fe11480df64ce9065e637ee52e662e5afa4"
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
