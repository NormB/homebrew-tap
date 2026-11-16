class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.260"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.260/sipnab-0.5.260-aarch64-apple-darwin.tar.gz"
      sha256 "ba0f8d590efd3f89a8c31110e8b13f961cf2303c420ccba181d43b2bbc585989"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.260/sipnab-0.5.260-x86_64-apple-darwin.tar.gz"
      sha256 "e9ce129ed756a61a0eeb553d8d7b39b56cc8ff97a5ad0c18afe63c051a3ea83a"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.260/sipnab-0.5.260-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7a7e8372d32c9005373fa3ad4b292fbe0209154d435c2395f763b6eaae72f582"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.260/sipnab-0.5.260-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c44d374943a17295b868d3376701dd3965ad2cc67fec4ccd9cd2f2d05640439"
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
