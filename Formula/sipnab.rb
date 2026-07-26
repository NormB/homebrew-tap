class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.41"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.41/sipnab-0.5.41-aarch64-apple-darwin.tar.gz"
      sha256 "5227375e70c2eefae5ca83561ab3085ffea42da2d8fd6861dd958aad4a9dc30a"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.41/sipnab-0.5.41-x86_64-apple-darwin.tar.gz"
      sha256 "bafebd22e868a5913eb5667669a9e133f5813cd0364cab325cb24ecb0cf9ee0e"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.41/sipnab-0.5.41-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "414cd2db6bebb4bafdbe87ec2cd5ceae5ae4ef1e7bd7c62bfad30bfe83026b13"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.41/sipnab-0.5.41-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "32d0be49f87d1556381026d99a2c97b64f85495874b0ad86a1daa60bbf5993f5"
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
