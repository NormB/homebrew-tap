class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.81"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.81/sipnab-0.5.81-aarch64-apple-darwin.tar.gz"
      sha256 "46be304fa51fe0fab48c51ee3b0a00f3eba1f57b5e614c39be0e2de06fd5e0a2"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.81/sipnab-0.5.81-x86_64-apple-darwin.tar.gz"
      sha256 "e656ff090b1acc3fafed91a52afaa94ca3782d08cb9ba0b8c863887d235dbaf4"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.81/sipnab-0.5.81-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "02e784aa9a1d7a1db30ffbf5c8e8e02c96a1d3428fb58c5f6d4a8ccdd67cc3a2"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.81/sipnab-0.5.81-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "76c3ccb1707915e7e8a73e2f56dd0b75171f0c977f1b13fd1f3422fcd632f620"
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
