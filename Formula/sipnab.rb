class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.102"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.102/sipnab-0.5.102-aarch64-apple-darwin.tar.gz"
      sha256 "505a284de669a80fc88edfdda59e9719fa8a58e7d6a0b3db14914949d0f192b2"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.102/sipnab-0.5.102-x86_64-apple-darwin.tar.gz"
      sha256 "97b02198d0246ed48478892c42ae08db55dc608c097cf6dbb7ed106c25d0c3e1"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.102/sipnab-0.5.102-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b6edeadaa0776c30bb1750ae4a8c83d23b107bbc40444d2431aa9899e13a4919"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.102/sipnab-0.5.102-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "37c5853de70edabec5896392018458a2d6c2abd30c09baff8b176c6b6e0f5e5d"
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
