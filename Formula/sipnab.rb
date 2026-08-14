class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.100"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.100/sipnab-0.5.100-aarch64-apple-darwin.tar.gz"
      sha256 "bd38ec7ce96ade5a7bb2ddbac877ed70f9c52f0436bb82600ebfc25a4df53338"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.100/sipnab-0.5.100-x86_64-apple-darwin.tar.gz"
      sha256 "43216c87887bc1289a04925e5f8b21c563c41d8136cc91e505125027eb068a5a"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.100/sipnab-0.5.100-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "80798d04b92a86d8fa0e2216572cc11a4c8709b4fdabaf828a6e7ac769da13df"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.100/sipnab-0.5.100-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bdd4d420bd13c6e53c1dcba582f5ee3b85b9f6bca975c8a4c068d6f3522e2e9b"
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
