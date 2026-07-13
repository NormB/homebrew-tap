class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.4"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.4/sipnab-0.5.4-aarch64-apple-darwin.tar.gz"
      sha256 "d81b277a3278b3bfc51552acd162024465590e9f95f7b07bab01c9b01b0a83b3"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.4/sipnab-0.5.4-x86_64-apple-darwin.tar.gz"
      sha256 "58f077189acef76b7976032041d37c56af08405e3203040bfbb107300d3d7e71"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.4/sipnab-0.5.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0189b6422790abd0276615dffbd22468d6be492d8550157eb1f7a01376c65296"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.4/sipnab-0.5.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4a7eba87f0236f1b3053118282f24df896201c110ffce4b4fe4d394ce323812e"
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
