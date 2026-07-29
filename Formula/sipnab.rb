class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.57"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.57/sipnab-0.5.57-aarch64-apple-darwin.tar.gz"
      sha256 "9457068aa046d730cf633388000ed0a9c7135a838e2670fe36bba246bdc07ee7"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.57/sipnab-0.5.57-x86_64-apple-darwin.tar.gz"
      sha256 "13175a6d5fb2f2ec510e80ff661e59afa5dc94dd88bd2a92fa5406c7f6a9f910"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.57/sipnab-0.5.57-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "50b8a078743497e9265e9cbd9cf8da5c85625de0586e2875dcc891035a8dcba4"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.57/sipnab-0.5.57-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "528b31025a27d4c276b7884cae01faabd5450b217adad856fcba85a11a1e3ab6"
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
