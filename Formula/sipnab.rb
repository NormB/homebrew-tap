class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.72"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.72/sipnab-0.5.72-aarch64-apple-darwin.tar.gz"
      sha256 "73379825233063705f4a616812384d824fb5f5a5dc3ba9ab53c84503c9cc1b31"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.72/sipnab-0.5.72-x86_64-apple-darwin.tar.gz"
      sha256 "e48bbb0aac309bfeace701a5ed51ab7313257549ed07695663021322338c9838"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.72/sipnab-0.5.72-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f73add870216bfd2c1d6016aebbf4347998cf8085be1e442c7598525018cc94e"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.72/sipnab-0.5.72-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "73ae233ecf04d7f8d2a6049715750a276af349e6137bba34a8e59451f71abb65"
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
