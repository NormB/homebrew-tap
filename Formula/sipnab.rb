class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.258"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.258/sipnab-0.5.258-aarch64-apple-darwin.tar.gz"
      sha256 "7b978bfb0c698d0bae6beef893e761581641d7c83b826397dcc9a70f5beca094"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.258/sipnab-0.5.258-x86_64-apple-darwin.tar.gz"
      sha256 "f97e9de47d4da63188d870bc5a1e58fffa4eb9bfadb05044f1697e01a00b68ce"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.258/sipnab-0.5.258-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e13742b47a5da3e216971e66d5f46d5542caa360e5aab9fb235ae9eae2b02dd5"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.258/sipnab-0.5.258-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "529902ba835c61617665739c2dde95a48e05b11c8b43e105af206fe704062759"
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
