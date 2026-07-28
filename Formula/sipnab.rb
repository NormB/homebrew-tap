class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.55"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.55/sipnab-0.5.55-aarch64-apple-darwin.tar.gz"
      sha256 "ffceea09e14e86c35375c0976b3ee64f0e198ac0047a78143a41274b6aedbb04"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.55/sipnab-0.5.55-x86_64-apple-darwin.tar.gz"
      sha256 "ccc10be8f9004da234a9468e99161541a431cab35d58b247afd352c767ea2a61"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.55/sipnab-0.5.55-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "df8ad33a6440601d84f77a3f609d3200da86ff8b04f06407cb807579e2724f5f"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.55/sipnab-0.5.55-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "220f0b37b02b2adc137b31fdd02f788c2087d8d2c9cf3537984682fc00f1770a"
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
