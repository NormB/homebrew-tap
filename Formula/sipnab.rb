class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.92"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.92/sipnab-0.5.92-aarch64-apple-darwin.tar.gz"
      sha256 "3294cb7454f78cac7403512f7ebf880f3bfe65eec1b67091bdd0cbca6e3b1349"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.92/sipnab-0.5.92-x86_64-apple-darwin.tar.gz"
      sha256 "36f52b39b61b9c5814671f7128bcbe1025e7f8c05dc0d6c5bd8c591716d0debc"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.92/sipnab-0.5.92-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "88df37f825ff3bdcadfcd69d5599bcaea381603fe88be7a9fd2b066a63a4998c"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.92/sipnab-0.5.92-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a71c6a44195d3c1a49dd1bdadb2d66354136abeccc82f3b7bd7e315ffca17520"
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
