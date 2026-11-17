class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.262"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.262/sipnab-0.5.262-aarch64-apple-darwin.tar.gz"
      sha256 "c4b23f942cbc8db450da4b2482f4bd5bafecebb463aef987fc3649c354adc4e5"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.262/sipnab-0.5.262-x86_64-apple-darwin.tar.gz"
      sha256 "e7dd7d20e8449f0a73672118e67bfdb6bb6f9cfddc2a73c69d7ae0cb572f5914"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.262/sipnab-0.5.262-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a7e09f5ca7524812d42fb9ca5294f20a73552be915fcb5cd081a3a319d7aa9a2"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.262/sipnab-0.5.262-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f04846c3295cbe953b150ca8d7a672142ebb0baa40f73180ddf60f8b9c4dca9c"
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
