class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.222"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.222/sipnab-0.5.222-aarch64-apple-darwin.tar.gz"
      sha256 "0f8e9055443dda144fec430c6570835bf1d3a69350a3ab7143bef5fbcfbf0b08"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.222/sipnab-0.5.222-x86_64-apple-darwin.tar.gz"
      sha256 "3312b19689e159b728e9c7ba20b922bdb71f754eaa1641a83903433f69dd7152"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.222/sipnab-0.5.222-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "94c9db20fa4f007e89e86d1b7b397a450101fb854481066659bb63ef51c52d78"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.222/sipnab-0.5.222-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c644002bfd00a3da1e5643aa9a81a32a2706cbc8548f716685460b5f8763cdc"
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
