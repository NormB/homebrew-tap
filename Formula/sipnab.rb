class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.95"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.95/sipnab-0.5.95-aarch64-apple-darwin.tar.gz"
      sha256 "0635d3ecbdaf9c6132897dc225bb6427f2465f572b7f669991398bda4514fa1c"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.95/sipnab-0.5.95-x86_64-apple-darwin.tar.gz"
      sha256 "75d85e612e642c8688ccc329c39af796fc280c343299ae0c7d1add8dc3c60897"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.95/sipnab-0.5.95-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1367df1e54150090f85ad7b76b4a5e6f1ce1d2040935f520bd585ecd1a18212e"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.95/sipnab-0.5.95-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e0c6d1211acd6a131b441c7152e8a635a4f1dc6748ff66a12ab16bcfedc5fb49"
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
