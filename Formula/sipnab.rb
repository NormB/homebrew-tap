class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.75"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.75/sipnab-0.5.75-aarch64-apple-darwin.tar.gz"
      sha256 "aff79591264e2133014a333286d10b7846b59ac1168a0215925a4b395a2f4027"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.75/sipnab-0.5.75-x86_64-apple-darwin.tar.gz"
      sha256 "46ed72e416521d092f69a7cc5fe937a422c8b08eec894f9c6426ec7c82febdb8"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.75/sipnab-0.5.75-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "90263f72284c67a1fbed921e7150bae5222328ec5bc4d7bb44cc586e99f2f4d4"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.75/sipnab-0.5.75-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "889744aecd3bd214f9688ebdbda2ce3554666f10d63d99a9f1ffa53c7bbe1250"
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
