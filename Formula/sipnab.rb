class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.215"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.215/sipnab-0.5.215-aarch64-apple-darwin.tar.gz"
      sha256 "c23d2acdd8662814ed1196c4239d2e113c381f07c13a5eeffd82e2c3c90c44f9"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.215/sipnab-0.5.215-x86_64-apple-darwin.tar.gz"
      sha256 "98662c4830a78221841b1ce93b639a13da0aa1d946ca4745cc57e4cdbc5dee5b"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.215/sipnab-0.5.215-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "424362e755402a7f4eacf295cc12ffdd330a6b9791fee96670c9411fa1934d44"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.215/sipnab-0.5.215-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c47a4b0c5bba1cf00582bd189f088c1b89deeef0441e2cd97b8740d66ac8e9e8"
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
