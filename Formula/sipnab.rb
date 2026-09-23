class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.187"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.187/sipnab-0.5.187-aarch64-apple-darwin.tar.gz"
      sha256 "a50d43b31941268e0b93c6c1863911c31bc38b4de806694e1f8ab6573c3cac4d"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.187/sipnab-0.5.187-x86_64-apple-darwin.tar.gz"
      sha256 "f9a85e7e4ec534a91958045e38cdea025c974111a3a0f1bf887f2c6f814e626d"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.187/sipnab-0.5.187-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2887ad2ce76ac3cd5af39961b763821fa6f326365f214fd31396840d45781c1f"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.187/sipnab-0.5.187-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6dca7b1666c758414e45ad0254fc3a502b4723a043d1f6ecd72552e3a21d1b17"
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
