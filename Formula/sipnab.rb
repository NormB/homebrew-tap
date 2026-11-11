class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.247"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.247/sipnab-0.5.247-aarch64-apple-darwin.tar.gz"
      sha256 "b3cdb27e72d8b250bc28c2efcabe580995b0e737bb3ed99ef4b36b28ec1c73cb"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.247/sipnab-0.5.247-x86_64-apple-darwin.tar.gz"
      sha256 "4ea9c11a84cd9cb97c32b15a573b7bbf0f1794624be69d203d7802dc03f263cc"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.247/sipnab-0.5.247-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d9e380dd8a5911702eaf06de8c65d4ef96d40babf2de3797fb98c70b00bb78ec"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.247/sipnab-0.5.247-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0eb960ddb369d39ff98329d5faee0c56382a1a11fbfbabef7e923d7120dc399f"
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
