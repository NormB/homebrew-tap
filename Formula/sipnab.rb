class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.233"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.233/sipnab-0.5.233-aarch64-apple-darwin.tar.gz"
      sha256 "ca14a38f713ce808c03c5667133f94e7c481070e5ee7075ca1337748d5902a6a"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.233/sipnab-0.5.233-x86_64-apple-darwin.tar.gz"
      sha256 "81679823b18c04f0fac39efc47193930ff0f65c1daa82891de6534d7afdce910"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.233/sipnab-0.5.233-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f9778a306729cbd9b4c33a9f7255dbd0feb11f0d8c21c10113654cfc06de18b2"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.233/sipnab-0.5.233-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "09a0b9d2bff29bfd376467299911e2ff415f971a57a9d640973c1806c4932c37"
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
