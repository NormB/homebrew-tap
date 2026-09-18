class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.179"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.179/sipnab-0.5.179-aarch64-apple-darwin.tar.gz"
      sha256 "01e57aea3df6641f6b52d6988c5ff85b24d3446e008fa490cdc1ac58bd59d42b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.179/sipnab-0.5.179-x86_64-apple-darwin.tar.gz"
      sha256 "de03ebd2e68546e422851baa962d10075323fbe0e563ab859cb7dcc13fe181f6"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.179/sipnab-0.5.179-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e194feb9aa948c536a4fde0590c187080b9d4e84d69cc315912d9f68a267b631"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.179/sipnab-0.5.179-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6b3d932845ae48e1e49f7044f044083c9e4095a0f79e54a622c3bfbe99b8f89d"
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
