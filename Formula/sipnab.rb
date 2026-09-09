class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.160"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.160/sipnab-0.5.160-aarch64-apple-darwin.tar.gz"
      sha256 "af33ec6b7da575d8b375ae896fbd85e6b39f75560a70e51e859821bc4a03b651"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.160/sipnab-0.5.160-x86_64-apple-darwin.tar.gz"
      sha256 "d4ed92132785ed7bf876c1d166c9a0295be28f5b7d8007ee0b37695a7fcfba70"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.160/sipnab-0.5.160-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "68570fcee58760bcef2b165737554b9d31bdda780eb5af28b3176c205449c859"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.160/sipnab-0.5.160-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "91a07f1f81a9c64b03c0b290bc6714deefbd1eb0559b7426f6fbe6d1a5e67e36"
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
