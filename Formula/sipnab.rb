class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.166"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.166/sipnab-0.5.166-aarch64-apple-darwin.tar.gz"
      sha256 "711b27c022bdc0491e992f88dedf894891276b94d50dcb7b39ebb217f3a50c27"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.166/sipnab-0.5.166-x86_64-apple-darwin.tar.gz"
      sha256 "e2e6245dbf2755c1354beeaaf34236a0c04d1172c4df74be7e42e7aabba5131b"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.166/sipnab-0.5.166-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "13f33900012f2ee9eb32558fdd6503e1a04d06027442fbda71dbfcb0988443fc"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.166/sipnab-0.5.166-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3218e2aee5e9796873ffb6b4fc37e1a1202e3d0a654a9bfde473fb429224e903"
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
