class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.192"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.192/sipnab-0.5.192-aarch64-apple-darwin.tar.gz"
      sha256 "db577b1e3f361706bfb56fec09857be21a35ba6f08d7e12f85c717279e20ea3a"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.192/sipnab-0.5.192-x86_64-apple-darwin.tar.gz"
      sha256 "01499a87c7a3dd182f0bc8b82f15aff62a35c2343f0aa791e534d88ef36cc378"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.192/sipnab-0.5.192-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9af46ae1fd7f3630f1d9572fb50aec816e65c965cf3f061336610ae43b215a65"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.192/sipnab-0.5.192-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8793368ce4aec7e11e3a37219de204a8f470635a011cbf16695275d5e64205dc"
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
