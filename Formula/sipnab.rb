class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.13"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.13/sipnab-0.5.13-aarch64-apple-darwin.tar.gz"
      sha256 "6f5965240fed2977361802f72395cbe37bdac82f9caa51001d45940ea5794410"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.13/sipnab-0.5.13-x86_64-apple-darwin.tar.gz"
      sha256 "e241c9a0269a27d4c62952f3b30926e94ade47a1b108856f272277427939a8b6"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.13/sipnab-0.5.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ae6ce0bd6bcfb08120e9ad91dfb205aadcbab4f593bdae17f99faee582c2dcc9"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.13/sipnab-0.5.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c4666a46bb6ab35c1f700a55b17e973a93e6d6f13f572ed4fa0356fe8f1b440f"
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
