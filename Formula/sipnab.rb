class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.46"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.46/sipnab-0.5.46-aarch64-apple-darwin.tar.gz"
      sha256 "fceeb1e7f2d6e5360c0202a198b323fc608ce38452bafc9867c203e185993209"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.46/sipnab-0.5.46-x86_64-apple-darwin.tar.gz"
      sha256 "f164152981bac7110fe5830cba60365553bf26017e8367cfb9fd115f01b1d05a"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.46/sipnab-0.5.46-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "28731a4d75c258093fa6681056d5d4981f88cf8870c611bc2334390916a65846"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.46/sipnab-0.5.46-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5c175edb3e5ac476e20273819e2a76e432ed50eece53b301b7241d3e8bccf471"
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
