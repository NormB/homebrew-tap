class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.199"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.199/sipnab-0.5.199-aarch64-apple-darwin.tar.gz"
      sha256 "9938ba92340028db673a9658ce6e78e95e5506e591ef1836d91ca300213259d4"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.199/sipnab-0.5.199-x86_64-apple-darwin.tar.gz"
      sha256 "d913258974ee9dd87e141bfcabf37a0bb77d91dc74ea2deb6764fe99610894a2"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.199/sipnab-0.5.199-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "381edeac5162dea4f846a7242c0adaaf4a3958313727aee6535b283971d68929"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.199/sipnab-0.5.199-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7508f3e54047df518ab19e466f9904532fa210d03f61eb3e2a9209af83cee82a"
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
