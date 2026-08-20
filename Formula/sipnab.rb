class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.115"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.115/sipnab-0.5.115-aarch64-apple-darwin.tar.gz"
      sha256 "1d5f283d63c0ea5b5e4cf1621cdd5e8f39e6ff3caaec9e5481fda252f1d1fafe"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.115/sipnab-0.5.115-x86_64-apple-darwin.tar.gz"
      sha256 "03f60917821b697a9be461c3f1d85a7828eb7df9d7b91817eb4ad7407413a5cf"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.115/sipnab-0.5.115-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "82b3bd13cdd94b4bbbee1c91b3ab1ca38bf52c4c8e90c4cff4b6d4a587bba235"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.115/sipnab-0.5.115-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5a419c3b0acb6525e1b16fc1bde24f30e1e31f630768a7a80053fa3d318ed28c"
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
