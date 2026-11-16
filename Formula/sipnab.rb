class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.259"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.259/sipnab-0.5.259-aarch64-apple-darwin.tar.gz"
      sha256 "fc37ec58f62822ff0ea0165536da48b357e95b5e97078362159d526325e614f9"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.259/sipnab-0.5.259-x86_64-apple-darwin.tar.gz"
      sha256 "c510a12adefa7643f986cb4fbf2c27f6ad3fc6d68c0fb45ba02b98bc746e1a4e"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.259/sipnab-0.5.259-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "23a792a593b427045d26fdcd672c62b559374cad51339c6ab2bfcc561e7aba75"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.259/sipnab-0.5.259-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "39481fa0b6c52dbd67118d0bf776ec124ac8a7606be9c8659ec20280c930b80e"
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
