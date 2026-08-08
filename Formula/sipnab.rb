class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.87"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.87/sipnab-0.5.87-aarch64-apple-darwin.tar.gz"
      sha256 "305408b3dc9f59afa44ac24af22acc2dbbc94f417fe005b7098b8ce9201d8a25"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.87/sipnab-0.5.87-x86_64-apple-darwin.tar.gz"
      sha256 "b11251cefe9487cf992c8319407ae5550286581d697dbe6cdc7b78ea57bba8ae"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.87/sipnab-0.5.87-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ca6af26a89a4319d8b7450b4ca7ca7298c662eb811f763092a57ea1d5c14af3b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.87/sipnab-0.5.87-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4b4c9bc2658eb4bb01bf84b9dd1dd70527c88442b7850a7ff0417c50fd0d0087"
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
