class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.170"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.170/sipnab-0.5.170-aarch64-apple-darwin.tar.gz"
      sha256 "d1694d58fa19980beac47894cd7eea2293fb308429ef31e4ea5a05c08f8c5724"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.170/sipnab-0.5.170-x86_64-apple-darwin.tar.gz"
      sha256 "836765e8125c58db25e4f8ee9bc5f148ead6d3b67185a1ad19470a2271fb3665"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.170/sipnab-0.5.170-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "13e90753c7100438eb01c38e8652fc3928d221f379057229700783a0300f308d"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.170/sipnab-0.5.170-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7243ff84c6807bd1700c51cc0540233de7487ec6881306d71650acf45393ec5c"
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
