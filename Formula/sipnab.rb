class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.44"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.44/sipnab-0.5.44-aarch64-apple-darwin.tar.gz"
      sha256 "b33312b6afee01a636c7e0d299ae3b990687938c034aaaad0965f03699549629"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.44/sipnab-0.5.44-x86_64-apple-darwin.tar.gz"
      sha256 "6c0f7a9f6c055d04a4d5be369ec753bf27fb426e1180e224caa80024cd70ff4a"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.44/sipnab-0.5.44-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "96431ac8209664b2e3f42d2f0b8b3c33aadb7497d2b9be28ffd6b0454403bdce"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.44/sipnab-0.5.44-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3cc009c91b641c0e6ca8d1b375ef10577fb72d4decf052a5b7274e4633f109a5"
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
