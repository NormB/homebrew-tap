class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.190"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.190/sipnab-0.5.190-aarch64-apple-darwin.tar.gz"
      sha256 "b610f152305541711ea6250c4d8e97aba8de320f8344e3933d6b1c133de01033"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.190/sipnab-0.5.190-x86_64-apple-darwin.tar.gz"
      sha256 "0a6057b9a6d4e07953ca9afee6481b730c2fa8253db99ddb2cac65187134b90a"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.190/sipnab-0.5.190-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d17a4a3f8a5185f926e450a23fa655ccffcbff942390ab3226ceddf27266660b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.190/sipnab-0.5.190-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a01f1c8a093a8d496919c0b8212dbe91e9b4b74d8b3ed32ce6feba9c1d5cec82"
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
