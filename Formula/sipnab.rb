class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.213"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.213/sipnab-0.5.213-aarch64-apple-darwin.tar.gz"
      sha256 "dabe2713854db94ec603a32b45afc67e584d61e0772e51c4d7a4b08fdb4d6ed4"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.213/sipnab-0.5.213-x86_64-apple-darwin.tar.gz"
      sha256 "d8e70310a6f69c212114a4f093744d2c4e3ae0df20d2b7bc2528514ff5cb317c"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.213/sipnab-0.5.213-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "33e0875bdb2d9dd1c9675d526fd8f3ea9a3a98555817ea74c997406a84ddfd91"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.213/sipnab-0.5.213-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "027d7de66b03e46362794685ab095f59cc0a4ad353fb168abcaf47aa0cc13bbf"
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
