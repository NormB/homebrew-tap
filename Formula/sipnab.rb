class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.185"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.185/sipnab-0.5.185-aarch64-apple-darwin.tar.gz"
      sha256 "d98542e6224be4859087ff3cb30d824c0ddb4d64a18324d3db0e54895f972af0"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.185/sipnab-0.5.185-x86_64-apple-darwin.tar.gz"
      sha256 "af6b98638f8152cdf0e6d3664f5ed7123528a8c21d9c574cedb2bf66b5d93578"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.185/sipnab-0.5.185-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "90999f6b29c7c131345f0a40865b6879b170a95c3fc0c6f55cf598b75bf98e2c"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.185/sipnab-0.5.185-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a9b5a86f49825d9a8c2bb2e22e6e66d082919a60917c355a0db3e893ebd3516d"
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
