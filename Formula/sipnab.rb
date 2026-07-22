class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.24"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.24/sipnab-0.5.24-aarch64-apple-darwin.tar.gz"
      sha256 "3ec752ac58dcecbda2455cc77ddd4ed739ad975f8dbb44e7734d1cbc29763101"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.24/sipnab-0.5.24-x86_64-apple-darwin.tar.gz"
      sha256 "ed88eccd1b58c7e37186986e8430bc617a4121d9288d72be198ba76c134b5fb7"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.24/sipnab-0.5.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b06f6f830795c0ccb3429d5e3e76a0baaba955111ce437d9afc5d10f14230a68"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.24/sipnab-0.5.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "129de874ed6e32d341ec8c590c60b83f5f314c8b3dada46855cba03420a0e69d"
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
