class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.50"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.50/sipnab-0.5.50-aarch64-apple-darwin.tar.gz"
      sha256 "6010fa5ffade9fed8154f0fe3b5ebfdb9c32179060917e4cb62ecd7ef95ff4ce"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.50/sipnab-0.5.50-x86_64-apple-darwin.tar.gz"
      sha256 "c40dfdd8351a2e6b7d4093defed6a05b9c82f9a89f1a5afc941ac718b130701d"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.50/sipnab-0.5.50-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e334b0738ca863bd9a98fad963ebe2a003e940892d45ad8a648b0f95d02b1e8b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.50/sipnab-0.5.50-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7a97483d55b1bcad58b51f24d660a8483240024ffd404594b5252064f87f912f"
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
