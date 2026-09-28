class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.195"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.195/sipnab-0.5.195-aarch64-apple-darwin.tar.gz"
      sha256 "24e1e73614d2add08f3bb7c42bf2e7d057e53d54cedd911a169e2fde1204c284"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.195/sipnab-0.5.195-x86_64-apple-darwin.tar.gz"
      sha256 "d64813e1d8239cbad32c691ab1f74ee4f1fe03022bae25dae106553c581e649f"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.195/sipnab-0.5.195-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e37664b22eb2e911d55d528fcbcc45de2914a11a27533dded3f1d8cb5a23db81"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.195/sipnab-0.5.195-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e1145c212e878842dfc2d99b861b8ada03bb40a6296b08cd3e9721a5b644e7a6"
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
