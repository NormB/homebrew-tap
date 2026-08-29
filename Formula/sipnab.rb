class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.133"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.133/sipnab-0.5.133-aarch64-apple-darwin.tar.gz"
      sha256 "dea9a1a88c01e778cdf41f205b27d2db8c30f3de1d3732c00b450313d21f4470"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.133/sipnab-0.5.133-x86_64-apple-darwin.tar.gz"
      sha256 "6111a9b3bc022f0b838424c4d0e4a62c9a8979751b52d1e16674793ca94bff56"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.133/sipnab-0.5.133-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "280a90bebc962148649a4baf67d85b6de768caec967e55d84f3ea4d857561213"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.133/sipnab-0.5.133-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c5c5b7691e525942607da85461f93206a090783ac71235339465a75e8255f345"
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
