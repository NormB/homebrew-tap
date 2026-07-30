class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.67"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.67/sipnab-0.5.67-aarch64-apple-darwin.tar.gz"
      sha256 "c260a48103fc27e1d67fed9ed785984d3c27bd64b6f2f40756f6e86c052cbce3"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.67/sipnab-0.5.67-x86_64-apple-darwin.tar.gz"
      sha256 "09696006a16a24a00df6f1f39a1103bf64fa7e4549f6928bd912e6dee62a496d"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.67/sipnab-0.5.67-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "860e8a05d81a751c41ab61b6861846367e58242d531ae8256b28fea074c45a13"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.67/sipnab-0.5.67-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d7f96fe800f499ac7aa42730479a4bf7572d7d53d68b9198b9034de3fbf6eb3"
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
