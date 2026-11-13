class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.252"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.252/sipnab-0.5.252-aarch64-apple-darwin.tar.gz"
      sha256 "ab88c23c2e9a420d499a40cadcb026fb2f705ee3ef7267e48c8f21c5f38b9697"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.252/sipnab-0.5.252-x86_64-apple-darwin.tar.gz"
      sha256 "0dfcfb0cb19e4b7ff11b3a9a983aef94fac197252bfb8b55da8551e7b63c4f2e"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.252/sipnab-0.5.252-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f8c3a412c7c82b4c934dd51a551818bad7d746a89787a9b7de878e660251bef4"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.252/sipnab-0.5.252-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6fbf36d009a55581c6d4aec48636eaa8ef04eda1c8154ca0ef7298b208c23c54"
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
