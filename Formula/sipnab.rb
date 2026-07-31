class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.70"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.70/sipnab-0.5.70-aarch64-apple-darwin.tar.gz"
      sha256 "380a2eb00a6a8b8ce2f98bb21ee1edd73a491479c7c7c6eaf0c16a1beb1a244b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.70/sipnab-0.5.70-x86_64-apple-darwin.tar.gz"
      sha256 "87c796de53eb4b8c7967ff77393e4732ec085fbb22bef1d2276786f572f0790a"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.70/sipnab-0.5.70-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d028873972e7c29fbae6db6e6c732bdf9e888090d98a8439140872dd09ba4fec"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.70/sipnab-0.5.70-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a5bd2768a49cfacb967e4b548296082e008cc89c8c980ad5ac3c14fe71b33c0b"
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
