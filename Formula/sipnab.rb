class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.145"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.145/sipnab-0.5.145-aarch64-apple-darwin.tar.gz"
      sha256 "22e1279a3a0167820f230d0de115d3be03cef2dd098b240c549a67d968e7b006"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.145/sipnab-0.5.145-x86_64-apple-darwin.tar.gz"
      sha256 "b7a43e1d61a3851fa5a6d185ac70adfae80cbd1ca8620f82f00c40326c703cde"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.145/sipnab-0.5.145-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d602d806e79b55a66d08feefe585ab072e294c5b78f7cf5d3df42b060d057d5b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.145/sipnab-0.5.145-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4dc1a2870ac79d83c67050e7be5a449c9fc6cb665057099d74bd71c968dcdc4f"
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
