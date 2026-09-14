class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.171"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.171/sipnab-0.5.171-aarch64-apple-darwin.tar.gz"
      sha256 "dc1bf45fb4ca9c5a029b02e31fc1caad397e1cbde0c16cab839d9d32331ed6be"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.171/sipnab-0.5.171-x86_64-apple-darwin.tar.gz"
      sha256 "3b2e400ffdc6d896056233c850281d3bb9213753ac4a4cc88cc12edf4849931f"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.171/sipnab-0.5.171-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fa13122ee355ce27db472f87382054e003786ab99d8e9d80d9f61aa0f83adbb8"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.171/sipnab-0.5.171-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "254c82b3e4764f1fc450c1648ac1c508da6471c6ee5b6d9c9c7ec322c794589c"
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
