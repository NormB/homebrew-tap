class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.218"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.218/sipnab-0.5.218-aarch64-apple-darwin.tar.gz"
      sha256 "c3c8fea7c02f0367b44c6168fc6b171aea3d9ab25214321562e2b5f1a33ffd73"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.218/sipnab-0.5.218-x86_64-apple-darwin.tar.gz"
      sha256 "9c48664838e31790314af90ca3dd818244af4c509815493e6508409e4385f78e"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.218/sipnab-0.5.218-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dd87fde3a36904996902faca7c99a82904ede9d891e460adec844c4a36ef3334"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.218/sipnab-0.5.218-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "29ec76ffd31e9a349158190292871b67e922842b3a3ee6a891fc6ca6aa2c6062"
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
