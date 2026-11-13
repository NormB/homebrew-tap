class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.250"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.250/sipnab-0.5.250-aarch64-apple-darwin.tar.gz"
      sha256 "a78c7ac8168b474fe3b283039da49eed646a9a63fba3a9be08b597bd2d92baad"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.250/sipnab-0.5.250-x86_64-apple-darwin.tar.gz"
      sha256 "51b0e6f8e6df4d0dcee169e8c26dce80284185e71ca15e17523c5d6d89a3f5b0"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.250/sipnab-0.5.250-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d32c37369c2e6cabd3cee9710140b3d2513bae40b870a55e01933bd887e3aedb"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.250/sipnab-0.5.250-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8dd0e1c450f90893d409fc1230fb88dd1fc73ebbc4d487f09b4e1c74a2615f9c"
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
