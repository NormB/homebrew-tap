class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.161"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.161/sipnab-0.5.161-aarch64-apple-darwin.tar.gz"
      sha256 "dffcbbdf9dae110d1da154b26ccdca10b11dd1da4b4be242d8f1bd2e0cfe08b2"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.161/sipnab-0.5.161-x86_64-apple-darwin.tar.gz"
      sha256 "71efd313873fc771a55db4de50427a6f00dffb7daeddacee8cf5b9c668a08755"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.161/sipnab-0.5.161-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c6042b177bffaeba7270ace88555873875afbb1a5b3f8a5a903fd8f6005e5d4b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.161/sipnab-0.5.161-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f092f3c1e61bb9dec1615f0578924636684d04a8eb555c4c0657e18eaa9257b7"
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
