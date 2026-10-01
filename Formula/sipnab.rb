class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.198"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.198/sipnab-0.5.198-aarch64-apple-darwin.tar.gz"
      sha256 "8a054c4c3593291db94dc41e91bd571521a193717d1ec26f5e1a5b17a7787a48"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.198/sipnab-0.5.198-x86_64-apple-darwin.tar.gz"
      sha256 "eaf7ad5f5dd7cccfb97648fe2ebda0f60aed4eaaff59d73a959e18722174f232"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.198/sipnab-0.5.198-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "95a3c8e2c750df341200090a9be6589842510d0f456853fe6eb7c3ffa1ff69c7"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.198/sipnab-0.5.198-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "413b6e1903f4d394a8a5d873af74ba5e2460c37e1d88c8fd4849e4f89da0e175"
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
