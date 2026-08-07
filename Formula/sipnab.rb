class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.84"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.84/sipnab-0.5.84-aarch64-apple-darwin.tar.gz"
      sha256 "cdf33de30051ec372b6e8514aac847e24580a3955e80abb508cb5bb0944e3a5b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.84/sipnab-0.5.84-x86_64-apple-darwin.tar.gz"
      sha256 "e1fe9a17fde66bb8de0d398695a049e83c5267791f7daa4cb588c399da8fc2d3"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.84/sipnab-0.5.84-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cbbe3290b604e5b9c9106d812c303477cfb6aea9fec31915a42a81d7e058fd2f"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.84/sipnab-0.5.84-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8a80ecfaa0e7bfd04a1a90a1b3f354ea9c66e3c56d8aab7044b25a2dca3f0a2d"
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
