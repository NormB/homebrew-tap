class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.4.10"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.10/sipnab-0.4.10-aarch64-apple-darwin.tar.gz"
      sha256 "e6a212e6d9f59fa6e4c44f565ba930e319faa402b9b3dd84f1b31a3c96ff09ce"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.10/sipnab-0.4.10-x86_64-apple-darwin.tar.gz"
      sha256 "fb7452fb8f1e3d801e624db7d43f1e30faee631453b73292cacb0c33b57b21d6"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.10/sipnab-0.4.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d324783a6b712debd825ee185ab3aea83ea2879af8788ace7c8febd0c5d6dc0b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.10/sipnab-0.4.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2ea7dc322e9292d8aa6e33ee572e427cec2daf8ae6eef265ac833e79f05802d3"
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
