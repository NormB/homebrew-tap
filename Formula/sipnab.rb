class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.214"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.214/sipnab-0.5.214-aarch64-apple-darwin.tar.gz"
      sha256 "1970bdd714649e3767c6ae889b63f921a0378c3c7db08c259fae1b73030a8803"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.214/sipnab-0.5.214-x86_64-apple-darwin.tar.gz"
      sha256 "e3bcee399eefd4a12f0b2eca1eb79527f6156717caeb5e888a9de7a2a2edf6f4"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.214/sipnab-0.5.214-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3b7bad820653df2ea45b30850de3809b3f5ffee08f6da27670de8557120b7314"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.214/sipnab-0.5.214-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "113ad7a8908b912ca20059d79a342cbfc37c13b37e97caf7a8a09c6c36f0db18"
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
