class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.251"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.251/sipnab-0.5.251-aarch64-apple-darwin.tar.gz"
      sha256 "f838b19a469a1b34aec244d3b22b720b02ea7380cb9f2c4ddf3624ce99d65b0a"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.251/sipnab-0.5.251-x86_64-apple-darwin.tar.gz"
      sha256 "1e015345866efab79d26b016f399c4135bb095e9c487a802cefa3c593dbdfb93"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.251/sipnab-0.5.251-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "762f451c76bfb7981d653b80426717907647abd13dd0981297421bbc1a153c11"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.251/sipnab-0.5.251-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eb30d85f9ab36e6320a3e7c375fd55a2fe844e23743c8f4f9b2e6aecc5fbeb8b"
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
