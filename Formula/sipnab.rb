class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.174"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.174/sipnab-0.5.174-aarch64-apple-darwin.tar.gz"
      sha256 "50a8022138eb4a4a8c7936bc8beaadb31583ae6606394403f58940a0bb3d0e8d"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.174/sipnab-0.5.174-x86_64-apple-darwin.tar.gz"
      sha256 "6ce772eb2197a99e0036bedb33c684a06840510b635582a94feff8c1ee802258"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.174/sipnab-0.5.174-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3b2e62904fdae7f9e9b33dd311e6b6b732d00133b81acf645c930e6a083a7187"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.174/sipnab-0.5.174-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fe9f33f6311e0e73dd635fb73c941c76c5966d8bd56c13f4659c805b206b8900"
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
