class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.277"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.277/sipnab-0.5.277-aarch64-apple-darwin.tar.gz"
      sha256 "93c8b0f42bde67dad1e3e57da9ec0a185ac54abe01ff952fdd798613eff90d7c"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.277/sipnab-0.5.277-x86_64-apple-darwin.tar.gz"
      sha256 "a42a036998a994681b327a5c9922aa0646bce1d59c92a0ac2e52d797bf5ceed9"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.277/sipnab-0.5.277-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b75e32bed9a363963ba600536dfeb7cd400e9071d857dae0afe0b2d9caec166e"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.277/sipnab-0.5.277-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d6c7f6fbe87d5b97f9ed101ff1455b20ffaef18d60e42341683481dd7006cb7"
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
