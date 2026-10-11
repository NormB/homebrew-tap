class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.210"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.210/sipnab-0.5.210-aarch64-apple-darwin.tar.gz"
      sha256 "38e7fc25481ed9a50a8979a89eb9c39c8b21b64fb95c9e903e169f1cbd7c832d"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.210/sipnab-0.5.210-x86_64-apple-darwin.tar.gz"
      sha256 "d4145b0c6acbccae5a5a31df77e63d8fce9a71e8f04f01f372a72e9c1e8d07a5"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.210/sipnab-0.5.210-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "292665f2cfe49a74ef4651c4f54b7bdfefa13b77ae7bee6311e612ce35ab8d6e"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.210/sipnab-0.5.210-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0a5a050e0c45bebe14b2a01d24c4698c39b1587f1775e1410b93cfd4e1e611f7"
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
