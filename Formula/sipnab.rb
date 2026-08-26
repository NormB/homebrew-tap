class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.126"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.126/sipnab-0.5.126-aarch64-apple-darwin.tar.gz"
      sha256 "e4ee6bd6e4c7ae4c34e15977fdd71ac95aeaef5d08629450780e0891b68fe1c1"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.126/sipnab-0.5.126-x86_64-apple-darwin.tar.gz"
      sha256 "aa2cb4fcbe7f0b651669475d03fef9ba1301ca10839bac8cea3ec98fa0db5974"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.126/sipnab-0.5.126-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6d542c72f4ce39270842a4d375a395c163e747d03ca02ffd25fdd22094675f6b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.126/sipnab-0.5.126-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d69401c2982dfbba27502502ea2fd492c94fbcbc33ef5a53cbb60bf2976579b4"
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
