class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.269"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.269/sipnab-0.5.269-aarch64-apple-darwin.tar.gz"
      sha256 "b9acedd04d9660aae5bbab5abdcfcf35b674fa848974d5c64249cd8a68067d8c"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.269/sipnab-0.5.269-x86_64-apple-darwin.tar.gz"
      sha256 "5e72ee8d88a911c5de741ed74b24333d9d632e1cfdb3e068fda0bbda8acb42d0"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.269/sipnab-0.5.269-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ce95ed3293cfe63ae6b18fdd75f0d0cec79ebca69cc1bdad106e2efeba643258"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.269/sipnab-0.5.269-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c260e7f7d0fc2569b8ce9236a54a87d8a306f3ab128efe7926ed837db63dd4b"
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
