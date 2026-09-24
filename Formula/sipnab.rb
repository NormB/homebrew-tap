class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.189"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.189/sipnab-0.5.189-aarch64-apple-darwin.tar.gz"
      sha256 "e9dedd734420d01bbee1d73ab295d8f4817cf3f865fcfd51eb38a3d54d1b9a4c"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.189/sipnab-0.5.189-x86_64-apple-darwin.tar.gz"
      sha256 "b69e37467f2e8e001bc9675e85b35c4c5c2f66c8772b172c4e4403f0d1a28d1c"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.189/sipnab-0.5.189-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f802bbe964dceeb37eb5c3a18697fb73da1dc09662b65fb986f4313f97c5a249"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.189/sipnab-0.5.189-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f456cac30d0d1ad5aa1782d75c4adbddd35f25b76056b8bb55f0770284b40cf0"
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
