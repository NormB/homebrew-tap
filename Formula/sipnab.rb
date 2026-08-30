class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.134"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.134/sipnab-0.5.134-aarch64-apple-darwin.tar.gz"
      sha256 "832406041003392a6baa10400a7de65595ca8d76dd2234c1a668b3847ad77687"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.134/sipnab-0.5.134-x86_64-apple-darwin.tar.gz"
      sha256 "acb2cc24720e149f38277f684e4da0bcfa05875657bc5be20d7ad69c2a282156"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.134/sipnab-0.5.134-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4d17fe25a97b0c7e2546aa2f70aea70b91001a3366e0b1abe5403b556d28abdf"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.134/sipnab-0.5.134-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8420a5e4bbb1c8913237d676c309dc81d57781a9265867dac0aa17315014dde3"
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
