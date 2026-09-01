class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.142"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.142/sipnab-0.5.142-aarch64-apple-darwin.tar.gz"
      sha256 "6d462169ca7aa08ec048a94fa7bc25093a3ebc60b56518bb8a622f136cd3152e"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.142/sipnab-0.5.142-x86_64-apple-darwin.tar.gz"
      sha256 "8fc56561a24dbae07f8ecf8ca4f556c210dfdeb236984aa53d28154a3d7d09e7"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.142/sipnab-0.5.142-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c25451d014eaaf04a00f6c1970329bc894e6dbc16e05d65ee60d0142fe9bc553"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.142/sipnab-0.5.142-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "20dc3a4b3a8f413c2112a391e7ed7415a01abefc5716e2f1670d4199dd749ae8"
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
