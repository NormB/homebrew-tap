class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.194"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.194/sipnab-0.5.194-aarch64-apple-darwin.tar.gz"
      sha256 "334d07dc791eef65376be60a87a28029bdabd712c21db307a125e96c155de357"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.194/sipnab-0.5.194-x86_64-apple-darwin.tar.gz"
      sha256 "e1558356726edb07a96c8ecb7b97f15007f6fd27203866033cbe7b007884269b"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.194/sipnab-0.5.194-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0b3b1838fc07400b897518240694d91981132db31317e69f7a7b9ca77ecae2c1"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.194/sipnab-0.5.194-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d48701480e741a1da9e70be0eda220cf4f96cf271f128ffda07d5579338e0e0a"
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
