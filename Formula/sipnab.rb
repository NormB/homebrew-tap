class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.202"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.202/sipnab-0.5.202-aarch64-apple-darwin.tar.gz"
      sha256 "5ef33f2e13bdae410dbf94086e342f1230f948584c1601b3ab9f05ccd795d0ee"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.202/sipnab-0.5.202-x86_64-apple-darwin.tar.gz"
      sha256 "e3e3fc014b5f1d4da5e730998a71a8d6cc192d68a7295cb6d5373c852bbec4e0"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.202/sipnab-0.5.202-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c4149086bb3d410d36c15b22f9249ec746975ff6f7d3ffe8011b46a6b59f43db"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.202/sipnab-0.5.202-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "77f6242f041a090a296e7af6c3f895a385a343693414e14f952710edb9ad5813"
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
