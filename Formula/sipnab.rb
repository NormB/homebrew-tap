class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.15"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.15/sipnab-0.5.15-aarch64-apple-darwin.tar.gz"
      sha256 "eaaab72c66ab9394107026bf23d3100213fbcccea0bf9ad69b806a7765306fdb"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.15/sipnab-0.5.15-x86_64-apple-darwin.tar.gz"
      sha256 "d7054ca3e5cfe2472d338860505fbb78bcd5caddb4f35b1b05750836daadf292"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.15/sipnab-0.5.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7d40551f214a6911788b924f1267486fdbe66be5bae4f7f9764638e44c7d31e9"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.15/sipnab-0.5.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cd327343a1840829ca4b8bfb7a91054a4337be25ab91ffc2c9d863e0ed054c08"
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
