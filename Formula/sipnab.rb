class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.123"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.123/sipnab-0.5.123-aarch64-apple-darwin.tar.gz"
      sha256 "ca0c3bb634327ef3f773dc7fcc9ccaa2686db2e80ade85493443c59ae232a805"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.123/sipnab-0.5.123-x86_64-apple-darwin.tar.gz"
      sha256 "a73160bf9550dafe29343cc37dad5295e857851c6aad174c91ce0b6393aae387"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.123/sipnab-0.5.123-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6677f4c50801c97c7029cc6fd75079171a25d27ffef270be1cfdf1d3c88b1771"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.123/sipnab-0.5.123-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "08ea21156974ba5f3d51b178dd0be7dcf1daf6cb10a8ea1919c24f3bbc7362c9"
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
