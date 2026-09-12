class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.168"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.168/sipnab-0.5.168-aarch64-apple-darwin.tar.gz"
      sha256 "035f9f73ac28aa708d1b2297b162bd66bfbe4733262c0e962e4fc2c0c661cd8c"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.168/sipnab-0.5.168-x86_64-apple-darwin.tar.gz"
      sha256 "980d5a5a96eeffb15e35214ecc2bb0ead8a5c7ad15677a3bf153d061606bd85b"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.168/sipnab-0.5.168-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4e950edb5464bc1e7e8077d0a1ee3ad0c260b0c1854e10e097cc9f0963892252"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.168/sipnab-0.5.168-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d271364be5b514e4e5e912041095ada2dc756a98f16501cb843f03b536b14764"
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
