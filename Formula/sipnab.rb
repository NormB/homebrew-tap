class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.4.15"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.15/sipnab-0.4.15-aarch64-apple-darwin.tar.gz"
      sha256 "053b4953c051d2228beefe5dc6d8e1782ba2d1f8375bff8880a55ee6c9642296"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.15/sipnab-0.4.15-x86_64-apple-darwin.tar.gz"
      sha256 "8773f2cc64a1d3879298a82119ec1366128af3caac152ce57c1842aa112b585e"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.15/sipnab-0.4.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "10c03317ca52bb714d7640f9c905801b610d21bd519a4190fbeb8f4b8016a04f"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.15/sipnab-0.4.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7fc9cd87bce6abb59a11e4f2041f2f06dc51242c4cd3604cb5083820b9ee6cd8"
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
