class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.107"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.107/sipnab-0.5.107-aarch64-apple-darwin.tar.gz"
      sha256 "b05c6b7c63dde1e843345276f5998aa6cbb0df1f2081a5b1a613dff798b97b3f"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.107/sipnab-0.5.107-x86_64-apple-darwin.tar.gz"
      sha256 "f94c4066c74de20895dd3190c6ec98bd326a74001b65eb9146d36027f993b073"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.107/sipnab-0.5.107-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "749eccc5e50bd1ffde89d11a8fbfc5405439bfeac5539c4ffa73788f41dce1cc"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.107/sipnab-0.5.107-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "113480e238f8678c34021d4be2cad2a9c59317170ce4b1293c9741b4c86ec604"
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
