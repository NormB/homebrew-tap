class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.104"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.104/sipnab-0.5.104-aarch64-apple-darwin.tar.gz"
      sha256 "8d39a1c159b68a7358c9eee7095e04e8b05ee2743773345c3161589da1c34344"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.104/sipnab-0.5.104-x86_64-apple-darwin.tar.gz"
      sha256 "becc8e691151d92a02b2c7508a861696830f0b4f33f19286aaaaa046576840ca"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.104/sipnab-0.5.104-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6126c52093ad9e89a9b1ce40544ae3d51d87310784b2dcb925644c3081ed8561"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.104/sipnab-0.5.104-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3c589e0b473fce62c986689cd0c8e06347362d83236c38c063932b3cea0aba2d"
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
