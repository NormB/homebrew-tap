class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.101"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.101/sipnab-0.5.101-aarch64-apple-darwin.tar.gz"
      sha256 "b21073e52956a57ea173724903da5295021e9a8ec9320b24ad6d9491b1cb3d1c"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.101/sipnab-0.5.101-x86_64-apple-darwin.tar.gz"
      sha256 "634a0023cdbc891b599d4d4997ced33e0345e4a1d8ef91cf15828c28616d9a9f"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.101/sipnab-0.5.101-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bcba6b587e80faf77dcf2ae015cf16f0710f1bfd059e74816f96fa32aa42c972"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.101/sipnab-0.5.101-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0cc6200d13fe2cfc5e9dc2183866824f8e85b5368ea2543779fa0de1854f2e40"
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
