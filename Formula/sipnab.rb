class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.65"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.65/sipnab-0.5.65-aarch64-apple-darwin.tar.gz"
      sha256 "c710c225e6a7ab48d9c6d979142460765f29257536030b96fac4236c715c96b5"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.65/sipnab-0.5.65-x86_64-apple-darwin.tar.gz"
      sha256 "632b41bb3eb5ebf78908dca1d31326e3e388f21c0f3ca533f98e0eca44e94173"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.65/sipnab-0.5.65-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3c8c4104406566c02b1423e5435f5541da4a6b3c1a628a4d47aa6526b3754817"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.65/sipnab-0.5.65-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "485c00a5ba131c062766d43c694cb7ea1da1938b15d1838fab7bcb46f02416f4"
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
