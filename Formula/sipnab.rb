class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.180"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.180/sipnab-0.5.180-aarch64-apple-darwin.tar.gz"
      sha256 "d6f5a57ae2aac9301244003298bcceb4fb406f90544b2e0d06e5d690ef86d3a2"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.180/sipnab-0.5.180-x86_64-apple-darwin.tar.gz"
      sha256 "6841dfe4edebcde69e789273b07df2aa2ca88ab09533656d504c4a3504d8466f"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.180/sipnab-0.5.180-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "936766fe7b4c67e81de6eec1f6c4697c22f21f4bc347f7773a0ce2603e6b431f"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.180/sipnab-0.5.180-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "48264ed57aeaef350a94dd6a8340d78ed0e6b16f3786b658a79c9bdedc984546"
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
