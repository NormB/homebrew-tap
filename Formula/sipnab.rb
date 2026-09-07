class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.156"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.156/sipnab-0.5.156-aarch64-apple-darwin.tar.gz"
      sha256 "6439be6d5d598610bbb2144641d31ed27ca37a99893b49e4e612bee478a03ac8"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.156/sipnab-0.5.156-x86_64-apple-darwin.tar.gz"
      sha256 "f35b878436007abac347ee7ad6183f9ea9cc21eb76a027256f5a88d5a5ab0715"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.156/sipnab-0.5.156-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f310c1148d5f569abf642c8619c6b46627ce45065d6b7216ffd338497f4fdff6"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.156/sipnab-0.5.156-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d8923f3a11e8a67c439c47eb31c852b43a845a83e90b4eabf85a076f3aea1a5d"
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
