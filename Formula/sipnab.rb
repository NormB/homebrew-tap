class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.66"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.66/sipnab-0.5.66-aarch64-apple-darwin.tar.gz"
      sha256 "dd72f7e872faef9ed8e0bdc1a003622d5b9f33b7d8aed0870561aea3a84b4afe"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.66/sipnab-0.5.66-x86_64-apple-darwin.tar.gz"
      sha256 "e0db52a4c37beb0ea260a1d5eec948c5a8c898aa2ff072c1801fc92a6e8c1478"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.66/sipnab-0.5.66-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "533596d438ed0f978e1bf51468e9e3fd386cf89557aa1a52667854aa903d6b40"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.66/sipnab-0.5.66-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "338674f1681909668c381263a9521578ff358478d7ca2eed69d16c8b0f106e3f"
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
