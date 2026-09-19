class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.181"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.181/sipnab-0.5.181-aarch64-apple-darwin.tar.gz"
      sha256 "ad5e2634a421ff7eee9bf465fceaf51e65027a61a5dc7d01690ec9bd586e376f"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.181/sipnab-0.5.181-x86_64-apple-darwin.tar.gz"
      sha256 "4d4b0b37ab6043f557537ac81ff584b46c6d4bdf9727c556fcd11132e4de7897"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.181/sipnab-0.5.181-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c96ceb92f405a4fba545aacb19687ef316acd03c816f33b3809fe4bfd06fef50"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.181/sipnab-0.5.181-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "893380a8180dd7ecda5b80dc28f159387ff3b10a33f97e66dcb6b95d403d3b5b"
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
