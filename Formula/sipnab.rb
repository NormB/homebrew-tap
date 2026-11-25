class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.272"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.272/sipnab-0.5.272-aarch64-apple-darwin.tar.gz"
      sha256 "f8e701f9d15fbade6a02fb4914746332ad384048527079933cfd497c3d146495"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.272/sipnab-0.5.272-x86_64-apple-darwin.tar.gz"
      sha256 "2cf66ba4e6067baf408d121d4a8157ed77e21c87ce6104038a25445edbcc60cd"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.272/sipnab-0.5.272-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d1fb420eb085ef3127d3a12382f9a697992b91508e757a9add1a6b28182ebf1a"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.272/sipnab-0.5.272-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce9adfdd908e9497066a2a84a51bc8cd4720bd39bf47f5baf26d0555d3ad0da4"
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
