class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.124"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.124/sipnab-0.5.124-aarch64-apple-darwin.tar.gz"
      sha256 "9879ea6507fde292ef8a94b4f853b5d4af8299033ca3d086212352d37dbf86b5"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.124/sipnab-0.5.124-x86_64-apple-darwin.tar.gz"
      sha256 "2ebd0b4d4abc0c2d5cdd2960d8c42d36d9003b7e591c3adf2847b130478a029e"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.124/sipnab-0.5.124-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bccf00f880a1d575cbe552708a015554bc0011031b42200db6eb459dd9e1b907"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.124/sipnab-0.5.124-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4f18b6f33e5523f04dddf199571177491b9cf71d17dc5ac1b09fc91df00c5945"
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
