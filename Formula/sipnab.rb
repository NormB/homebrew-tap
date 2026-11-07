class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.236"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.236/sipnab-0.5.236-aarch64-apple-darwin.tar.gz"
      sha256 "55e0e9a027b0b1bafeeb4c7e65554979c5bb17f99169e8dad55681fd4030fe6e"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.236/sipnab-0.5.236-x86_64-apple-darwin.tar.gz"
      sha256 "e49e9b72f9984d8b203aeac0c0c2c3caf188b8f68d22cf0f7c8d0ea91a76612d"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.236/sipnab-0.5.236-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c57fade573935ed50f09bb22078700120ab276a1f36b01bb3d063c29982993e9"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.236/sipnab-0.5.236-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ecd109cc86745ead0f48a212bdbe4738764831e1ab00dc51a0bf71227dcd5aa1"
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
