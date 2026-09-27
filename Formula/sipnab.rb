class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.193"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.193/sipnab-0.5.193-aarch64-apple-darwin.tar.gz"
      sha256 "f7b1c6c9586934a48a2b0476e6be47f9c209349ed1b2d87ffe83710848cb9ef7"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.193/sipnab-0.5.193-x86_64-apple-darwin.tar.gz"
      sha256 "e74008f04ff32ff4253104c97e1398ffd748292b34ef60fb506a5b4c3df05bc0"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.193/sipnab-0.5.193-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c34ea8c8a3d7e4477c00ad443757adb33a524f95b41f0f323b5acc22f3024eb1"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.193/sipnab-0.5.193-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3478c35b39f43ff703d80955c251d87aa1110190f5e983402ac0578dfaa8d591"
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
