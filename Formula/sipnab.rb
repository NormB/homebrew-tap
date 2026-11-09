class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.239"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.239/sipnab-0.5.239-aarch64-apple-darwin.tar.gz"
      sha256 "1830961340310b08ff4db43c701315e2d4f0c883a09da6315fca37c6661d9447"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.239/sipnab-0.5.239-x86_64-apple-darwin.tar.gz"
      sha256 "f8a2f35f9e00d28d67a63a2a8b41a4afd8e1ca6ea023f9ed57d108ca6e1cc752"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.239/sipnab-0.5.239-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0d3412d87fda2b91a4cf2b66e0248df8434f6d4f34179f9ebac3f39ecf3f1fc1"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.239/sipnab-0.5.239-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d2eeabb0c94ea8de9f0af67b96d4d8937681454a26d5326537e4932aa33a298"
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
