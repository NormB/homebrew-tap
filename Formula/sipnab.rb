class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.274"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.274/sipnab-0.5.274-aarch64-apple-darwin.tar.gz"
      sha256 "c5bfe8f3a10c933c4767db9180f17ccff91818e7cdc277e00db6c9dde45708e2"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.274/sipnab-0.5.274-x86_64-apple-darwin.tar.gz"
      sha256 "12dffd91cb807afdbf6683fbf3a3a530b57b39f26c084da156ad855698ff89b3"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.274/sipnab-0.5.274-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cd75e7f1a02b42a720a2f40bdf8b66e3efa6e1f0d42bdce0de6baa4fad6c4796"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.274/sipnab-0.5.274-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "89c0de1d605a44ab18fda35e6abccb84f19506b9a31c89132094ac084ced1eff"
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
