class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.4.6"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.6/sipnab-0.4.6-aarch64-apple-darwin.tar.gz"
      sha256 "0c3c5bc19c5f097cb21e93f6fe11134653afd8c21348b23f44b73454b7acfc7c"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.6/sipnab-0.4.6-x86_64-apple-darwin.tar.gz"
      sha256 "6f8f13dbb96d48cc3f99c57baa4a5012597cc6a22fc430d4bd7ea0efc576d0df"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.6/sipnab-0.4.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "62a38e0ce516eeeb852943ee63a1d7006859ad6607c5319f672d0694869d31d7"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.6/sipnab-0.4.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a2e46deecdb8e20f62556409904ca7f21a9d8f801371456c6f81cb14f16634f1"
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
