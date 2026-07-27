class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.51"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.51/sipnab-0.5.51-aarch64-apple-darwin.tar.gz"
      sha256 "eb619fc5137bfe69ca7a17feb1c72baa7231cefacd68bef411ec4a8fc5e17d87"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.51/sipnab-0.5.51-x86_64-apple-darwin.tar.gz"
      sha256 "a10b1bbdc64f1d770957a9d081115a28236271b5208b48ca59a745f9d75ecdf3"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.51/sipnab-0.5.51-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c302cfa9131320aebfffbf26393a984a9a8e344d53a8a703535735c2d42f1160"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.51/sipnab-0.5.51-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "35d43fdd8db8c3eebf79b4df11b0d4bfac54bf7681313f53c8149235187a421a"
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
