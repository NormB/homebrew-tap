class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.59"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.59/sipnab-0.5.59-aarch64-apple-darwin.tar.gz"
      sha256 "83cf40b827935f92a23ac1a81b778cfc16915371b12b52a177090370ad1fb7ee"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.59/sipnab-0.5.59-x86_64-apple-darwin.tar.gz"
      sha256 "92f018657ce8823092983b7df43560aa768728982c944e986a6e3288e1cc6543"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.59/sipnab-0.5.59-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8fa369d31f23c137a6aef935c1dde4c281dbb7f1a476da74fe3e8242ffaaa9ff"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.59/sipnab-0.5.59-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d89b72096cb852122a7d2e93376f18eca26ee86a0051c8bd2429968bffd7a0d0"
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
