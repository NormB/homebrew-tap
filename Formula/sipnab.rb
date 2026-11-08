class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.238"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.238/sipnab-0.5.238-aarch64-apple-darwin.tar.gz"
      sha256 "dfe44a792fcd6c328da728c1a6d5ac516ecf663eca1508b892dd67c06c68d906"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.238/sipnab-0.5.238-x86_64-apple-darwin.tar.gz"
      sha256 "94ffb04d33a73e04b0e4fffc975855138bd9d2fb8237e8a7f680eee666928afb"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.238/sipnab-0.5.238-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "62bfeac7a292d0f3348c67a6a016b611be009291ae9029d208263af16f1e48e0"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.238/sipnab-0.5.238-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7aa877f7f3acd94ccf13ca624e23257875660bc485a08938dbcddc1db69a5aec"
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
