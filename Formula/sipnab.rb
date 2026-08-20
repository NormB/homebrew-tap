class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.114"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.114/sipnab-0.5.114-aarch64-apple-darwin.tar.gz"
      sha256 "5a9cb57e78e6eea6cb080e4e7e7b6982c6eac116af0a9b5394ce8e6d9861f39e"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.114/sipnab-0.5.114-x86_64-apple-darwin.tar.gz"
      sha256 "4f318a507b2140e0d1e8ada45f3304da21f8f8f07b04242ce880ecf857d2b06d"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.114/sipnab-0.5.114-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2a49fa89a32eb0e4db995f657ff0df57622d1e3222cdbc5af946ab3a8e474ad6"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.114/sipnab-0.5.114-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9a2c91efc8a8074a352689d37b0c3b2e19ece0eac24be14f5aae225d11e79e85"
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
