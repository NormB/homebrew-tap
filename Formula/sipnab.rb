class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.4.11"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.11/sipnab-0.4.11-aarch64-apple-darwin.tar.gz"
      sha256 "631b5e146457ba4a08860062b8ecd15195f96647c77ba1bd396d2ca288e1167e"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.11/sipnab-0.4.11-x86_64-apple-darwin.tar.gz"
      sha256 "2bd8ee2d38a88dd1f8ec962e75a16331f08d76e8ce6a847de5d66fbc3ac5608d"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.11/sipnab-0.4.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "19b8419c45397bd6ca1716f2e1483f3a150a0368ba339df845b17d89abaf1f08"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.11/sipnab-0.4.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c0cce111a81504ef1d3508b2ef80f94209e505e0b3e0e1bd2db55f77434d500d"
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
