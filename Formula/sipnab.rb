class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.227"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.227/sipnab-0.5.227-aarch64-apple-darwin.tar.gz"
      sha256 "2f78b0364387f7bb3cc9da1a945d8cb5d084e1401a0058a6b266c7d9cba0bacf"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.227/sipnab-0.5.227-x86_64-apple-darwin.tar.gz"
      sha256 "5bbc02666265613b29346e5a3783d2cc0f5ff0ce9493100eeb459d9049e09246"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.227/sipnab-0.5.227-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0d93d5e20f30050521b361d7847c498c1e1cc6dcd349e85969bdedb7c25784f5"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.227/sipnab-0.5.227-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "98ab64a77fb6b76ae589540eda675f140e8cb02bae5ec7ba94e2ee7f000a422f"
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
