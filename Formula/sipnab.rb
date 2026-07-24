class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.29"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.29/sipnab-0.5.29-aarch64-apple-darwin.tar.gz"
      sha256 "426ec511fd53758face3a46419250a5202ef6c5d7e995efdd518c4fb50eed729"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.29/sipnab-0.5.29-x86_64-apple-darwin.tar.gz"
      sha256 "41235ca5e41078c288610ddb32ca62f5567767ccb6e3f8ba9cc65bf14b37f1c4"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.29/sipnab-0.5.29-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bf6ca975b43b33164c84f92dda9083c36bebd5521913c4c8c24d739b36caf86c"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.29/sipnab-0.5.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "029b4ce7abc96a0a0b000fd18d17fb727275972a50326f3e75993a52a0f57894"
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
