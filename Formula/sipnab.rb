class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.49"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.49/sipnab-0.5.49-aarch64-apple-darwin.tar.gz"
      sha256 "0aad3bbab9dcdf10551b38d650342d819f0fabb6536b791a08068bf75e9e4083"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.49/sipnab-0.5.49-x86_64-apple-darwin.tar.gz"
      sha256 "dd2e1bda6aeae1d3561132e02a8d7efb20bce072e47145ad90ad5de5bdf6aafc"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.49/sipnab-0.5.49-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b76a7c089d06bd7aaae97c9b053328cbc4fea9d97aa01c9ff809eb0d4dc6b865"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.49/sipnab-0.5.49-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d7a36a1c87ac46640fefe7413dd1aa7820273d210e4c41b09ffd9f7473f32953"
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
