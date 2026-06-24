class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.4.13"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.13/sipnab-0.4.13-aarch64-apple-darwin.tar.gz"
      sha256 "eb3dbabeee7ed250869b26cd1d279b037ccf93183c9514173923d7c9f1c22124"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.13/sipnab-0.4.13-x86_64-apple-darwin.tar.gz"
      sha256 "02dd6d358cb6fcd895703fa707df15269bbeed311c2ac93ca96f7bcf8146a5da"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.13/sipnab-0.4.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "593c98a38c9b678931ff2b80a034ad911a86fee6999f830774cfe27f2ae55b96"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.13/sipnab-0.4.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8f6750bd15fd628fbe8733ca4f5f175679c833e0ed3e84c7f71bcd4510890967"
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
