class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.80"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.80/sipnab-0.5.80-aarch64-apple-darwin.tar.gz"
      sha256 "4b2316cc17c9651e01fc19c559fbf437fe050541adba74f7e814cd7a72185777"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.80/sipnab-0.5.80-x86_64-apple-darwin.tar.gz"
      sha256 "5993f08c9c3075e0e8109d729a094a1c02c12a2591f7a3b591692452904826db"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.80/sipnab-0.5.80-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "86938ead17be0591b336f0fbc3d0829bb3ded490ed54c294016aeaacb00bd54f"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.80/sipnab-0.5.80-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "84e6986af9682a432ca27eec0dc39bf3ef356f5536c18705f1b9521c2d7e2af9"
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
