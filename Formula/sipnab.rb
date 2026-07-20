class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.18"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.18/sipnab-0.5.18-aarch64-apple-darwin.tar.gz"
      sha256 "d6c3f1d2304381459e484ac5e63e74f1261abc61895d16462786498fef1df3e6"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.18/sipnab-0.5.18-x86_64-apple-darwin.tar.gz"
      sha256 "30eec432973e2f0e282754726500acf31d59e8217fac4ec9ca23f250bfefacdd"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.18/sipnab-0.5.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e6e572bb718036681be08ac3aca374289e4d59576b70ad8c11d51dd5b772493c"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.18/sipnab-0.5.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "571f1daaa11945ee6bbc69208d12300107ad5312da278b49c62eab8ab7fa2bd3"
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
