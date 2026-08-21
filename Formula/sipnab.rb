class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.121"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.121/sipnab-0.5.121-aarch64-apple-darwin.tar.gz"
      sha256 "6017db10d6c0945bfd864f57f985061d6047b279939f597418763c6acba7b2bb"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.121/sipnab-0.5.121-x86_64-apple-darwin.tar.gz"
      sha256 "1e335474c394a66fdec244a0dca28ca924772d2ca030f88b6d5949c4ce1831bd"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.121/sipnab-0.5.121-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8dad14e355ac415cad607e716668371c708b1f83ef63535074b3a44440ca4e01"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.121/sipnab-0.5.121-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1816246d83c1acb2681479e9704636b052604ae7f600c8c8c14902512bc2bc6d"
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
