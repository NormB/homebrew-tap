class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.211"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.211/sipnab-0.5.211-aarch64-apple-darwin.tar.gz"
      sha256 "b5a9ea4745662fea8ebf6dcc49ca886658c1a93f48b5252b1ebf0f58ec401d90"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.211/sipnab-0.5.211-x86_64-apple-darwin.tar.gz"
      sha256 "cc38d5f88f615877d22fe8b30d7d133eba0df1108aa9e1ac534a7d5a51005820"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.211/sipnab-0.5.211-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eac071291f4214d8b599fe0b5245baafa73c6ae6bd317dc1bb549612fdfa27af"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.211/sipnab-0.5.211-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "98cc33207ef8d689a8035f97b5296880c2527a8f1aa0c1c74712f824c6df3527"
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
