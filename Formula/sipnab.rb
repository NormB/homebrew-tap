class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.64"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.64/sipnab-0.5.64-aarch64-apple-darwin.tar.gz"
      sha256 "cf12e8ceecd4dbdd39ff544a499359d673b81694438e1caa2d01f141f2c0eeb3"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.64/sipnab-0.5.64-x86_64-apple-darwin.tar.gz"
      sha256 "36407a5a998a40a1faf1ec798f6cca26f624d65191def1ce9acaccc6ee185dac"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.64/sipnab-0.5.64-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e116b9eca56e94aafcf270d90ec643c042be885428d5ca1e2197afbab5f6b999"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.64/sipnab-0.5.64-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "26626d20946beabde2fcbe37e6f0e20e9787c0cdb4c2a36594759ddb7109a383"
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
