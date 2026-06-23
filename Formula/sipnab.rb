class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.4.8"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.8/sipnab-0.4.8-aarch64-apple-darwin.tar.gz"
      sha256 "e6082c35f00d2f8ce55242a7c555de44100f1d929268b81e8e4f63852a81c0b9"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.8/sipnab-0.4.8-x86_64-apple-darwin.tar.gz"
      sha256 "398506f8ae249e7957dbfbc66d4bb7ba06ae1055a6198b2591330a9a05b21546"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.8/sipnab-0.4.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "88b77369aa2a41683140a2a620bc94a94d417193b19bc078f31dfcdcb5571d67"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.8/sipnab-0.4.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "45915d0215c12651725c1b355079294e54296bf0e6ce494d64b6976f751ce72d"
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
