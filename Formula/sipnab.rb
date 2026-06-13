class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.2/sipnab-0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "f5c8ab13280bc37900ff9fe88f22296e603cb2529087aead5d435fbce80ca079"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.2/sipnab-0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "3b67665a0fdf154c000e8dfaf5010bbfc39ce2953be8570304647817ca54fb31"
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
