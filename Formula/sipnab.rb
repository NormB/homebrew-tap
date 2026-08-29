class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.131"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.131/sipnab-0.5.131-aarch64-apple-darwin.tar.gz"
      sha256 "051b863c3f5479d2297876e33ab80b21980d35382955f89c663c34d3ed5202e3"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.131/sipnab-0.5.131-x86_64-apple-darwin.tar.gz"
      sha256 "99d4c408a434c2630ded3d7c7d29d036e6aa2ad02522a1e939343c7a302b71cd"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.131/sipnab-0.5.131-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8b66f97196e0eb812b15fce978ce31261584fbb75095b867c7fa76f4b4a473b4"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.131/sipnab-0.5.131-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "88b15f53bf680022a7768d357f99ee93c569d605122d64b866d0c6540d8d998a"
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
