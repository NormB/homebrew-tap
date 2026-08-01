class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.71"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.71/sipnab-0.5.71-aarch64-apple-darwin.tar.gz"
      sha256 "6c421c8dc405db93c8c4efd0ece5fb80232928a655108fab57a5c4f22dc8daed"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.71/sipnab-0.5.71-x86_64-apple-darwin.tar.gz"
      sha256 "74afbc7e9bdac1cedb4ef6cae81a10f1ca2fe386957a5c9bc369796ea73090db"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.71/sipnab-0.5.71-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a5f345a836faffaf9a0ae8695f691fbe2c5e41419264a02d1ecbaf5c37bad041"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.71/sipnab-0.5.71-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "56ca43b4018aaa33660c5e990a57b3227741afc0baf5f95ea5015c80dd9bc4ac"
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
