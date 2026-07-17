class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.10"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.10/sipnab-0.5.10-aarch64-apple-darwin.tar.gz"
      sha256 "3291ba37bc98e1ffc08a3666b9ebfc3c41170e49fac5cfb60c4d59c018573ac1"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.10/sipnab-0.5.10-x86_64-apple-darwin.tar.gz"
      sha256 "5bb8686f396b12c5f4579ebf0c004f4bc95b6ffb8b74e4730add903f5f2dc6f5"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.10/sipnab-0.5.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "97beaa0cd2908c757194dc36b9d8718b7ac60c25fcfb3b9b33feb08f22a27c26"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.10/sipnab-0.5.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9ad689916a316eae782cb67a1389e909e748baf6bdc5f9fcc9ff047f653af0a6"
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
