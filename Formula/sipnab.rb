class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.27"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.27/sipnab-0.5.27-aarch64-apple-darwin.tar.gz"
      sha256 "2a342d97f89401acdb36c0a684a6775b6dd90a921f96176057986a09265a3394"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.27/sipnab-0.5.27-x86_64-apple-darwin.tar.gz"
      sha256 "9530c95189716fb96a1639dc2c1522cb651607c4c5b2502e1d918c04d531285f"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.27/sipnab-0.5.27-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c7463e92e065e179a408d2422a9334428cbcc18a85237fa364b6a99d7dff95c2"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.27/sipnab-0.5.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e7badd5c88113651a1e466f36145f9d8e07e6b3be535f3f791739c727b7af9c"
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
