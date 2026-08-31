class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.135"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.135/sipnab-0.5.135-aarch64-apple-darwin.tar.gz"
      sha256 "9536255cadb9d25ae592d9d3e3e738fd7841ea904501dd3aa10119eab542a155"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.135/sipnab-0.5.135-x86_64-apple-darwin.tar.gz"
      sha256 "34f0076d3808f52abe79d8d31afd20ee3cc68461915f2a7512c9ea0e60af3f84"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.135/sipnab-0.5.135-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4da1ef4e47ae26088c2ed621b3ba94f63922e4b5aa6418d948f4f6703baea1e7"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.135/sipnab-0.5.135-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1250c7230df2f1069d79adc9abdc05822281f968061b13eebc2fe200f81c6a49"
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
