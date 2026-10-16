class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.224"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.224/sipnab-0.5.224-aarch64-apple-darwin.tar.gz"
      sha256 "25972cd68882bec266aa6822e14de7743d716b2c629ab2b80e536edd3d1e66d1"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.224/sipnab-0.5.224-x86_64-apple-darwin.tar.gz"
      sha256 "ff847071ea2a8222f083c5ca0476289a5dc16bf490704706f27f435477c24ef2"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.224/sipnab-0.5.224-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8e24db3a7d49f42f57e6714b4e775d22c976660845b9b504985ef43e5f423fbd"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.224/sipnab-0.5.224-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cc5233fe32de39e8f9de7a8d5ea2eedb2f7d8b690aefdfdf7fb30b7040b5905b"
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
