class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.197"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.197/sipnab-0.5.197-aarch64-apple-darwin.tar.gz"
      sha256 "f30aed3f7aa421b4c64c0b8b1343849bb27b0e48d1efc53ad541a7d5297fb34d"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.197/sipnab-0.5.197-x86_64-apple-darwin.tar.gz"
      sha256 "cc39d6beede15b38eb0882f466bfa729f0d2d6034cf723160e5e5725bd9ec86e"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.197/sipnab-0.5.197-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e1c0cf8f48f9546e6476312ab45ffe4e6debe5559c921eee53b2c8fc6db82fbc"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.197/sipnab-0.5.197-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "680c822e8bb827127f3ebe99fc919d522bc63a39c58985945aebc2bed15629ed"
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
