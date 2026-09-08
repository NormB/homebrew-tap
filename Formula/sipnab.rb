class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.159"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.159/sipnab-0.5.159-aarch64-apple-darwin.tar.gz"
      sha256 "843315ed3e5caaa16991fab712da7bf8a385fcbdc798ebb3a56fafe4967bb5ad"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.159/sipnab-0.5.159-x86_64-apple-darwin.tar.gz"
      sha256 "ae92b8199fa7456dab985a1ee28efb3349f4c68d53c954735ab158f5b300aa95"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.159/sipnab-0.5.159-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6fa04928e0640161355714095af87f156ed7b52ba9fd66d2eb854a3e1f16a80a"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.159/sipnab-0.5.159-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c4726dbcb79a05ccbbe52b90b1205d42a594d97dbe7b34141650373f48c49b1"
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
