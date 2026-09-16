class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.176"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.176/sipnab-0.5.176-aarch64-apple-darwin.tar.gz"
      sha256 "e0bfa9df7efec321d3408a8f375ed87669b789857fa4c6839050a2bb35ef5ff4"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.176/sipnab-0.5.176-x86_64-apple-darwin.tar.gz"
      sha256 "f914a869a7cc6259854df3ea3dfaad9aad8b8beab520597e84614228fd47b512"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.176/sipnab-0.5.176-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2ce30c87afa510aa74f1e14c7fe6a86e8675c73b019bdc1780d154629f123618"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.176/sipnab-0.5.176-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b985c023981b3a71bb786d5696518ec82c14ee122a9851dda7268c9015318f37"
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
