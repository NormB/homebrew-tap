class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.177"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.177/sipnab-0.5.177-aarch64-apple-darwin.tar.gz"
      sha256 "c4e59d441c195033fdbeaa603b4a60c97afaac5d8d87514619ed0e1445094d8d"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.177/sipnab-0.5.177-x86_64-apple-darwin.tar.gz"
      sha256 "28283ccf00c70bd992fac23f32d9ac04a507fbf87d6481e255b9d0d6779d8c14"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.177/sipnab-0.5.177-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e0673211f3cbf43d5b5e08d60a28cd1cf57f4cb8bd835b4729803bff9297a317"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.177/sipnab-0.5.177-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e7b61b86f9e8ee9c6f2f401d098cf92cc990ded9250a1be4343cab5dda58563"
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
