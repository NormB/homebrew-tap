class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.201"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.201/sipnab-0.5.201-aarch64-apple-darwin.tar.gz"
      sha256 "85c1ffa4873f90e089d4ed45b6ef26a052f6df0236bca9fcdc44867154a66b99"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.201/sipnab-0.5.201-x86_64-apple-darwin.tar.gz"
      sha256 "92a77e1ffef1ce4671299d4811360b48d8703e39663e83b3aaa16c235e961ff3"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.201/sipnab-0.5.201-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f4c5e75e854ac2c88b1bf086f107b103e9fa8b3b7da3d18a3872f4b1f9203cca"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.201/sipnab-0.5.201-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69534e4462686be8b5ac3072c5d5e6aae2235dde14091fadf27ee0f6f7e49587"
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
