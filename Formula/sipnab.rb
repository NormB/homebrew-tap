class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.58"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.58/sipnab-0.5.58-aarch64-apple-darwin.tar.gz"
      sha256 "8ffd3db9edd7c7618ce1e37bba5860d16e3648e507d513b92a33f91595d386cc"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.58/sipnab-0.5.58-x86_64-apple-darwin.tar.gz"
      sha256 "9d08d0efe75a017fa8905d6c0d0bee5e4e24401b7396c82c2c4ca469080c4137"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.58/sipnab-0.5.58-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6ef78e32446a1c63b674d81c6dfcd74a410384ae25294bc1e9673fd28ea21806"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.58/sipnab-0.5.58-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2a06300ca6aeef090590d97c581f129ace7524c6e53089688f47370a0d6fe10c"
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
