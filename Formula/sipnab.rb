class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.165"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.165/sipnab-0.5.165-aarch64-apple-darwin.tar.gz"
      sha256 "7bc242d600d0ecad49160b8724a27482bc6de2ebcb6f2fd307218142376713dc"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.165/sipnab-0.5.165-x86_64-apple-darwin.tar.gz"
      sha256 "2df4d58a0c2bb4ca27546b6270a43389e954b0d0b121af0532003469fc7e0e2c"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.165/sipnab-0.5.165-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2e1cba227cf54cfee6560025aa38b3784dc14c0e9e06eee910fb7d3d64ae3c2f"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.165/sipnab-0.5.165-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f4ceef57917b65ce473741d6ccd612fde20ee9963fa88c487ad89ef55e044994"
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
