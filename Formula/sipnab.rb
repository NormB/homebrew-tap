class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.120"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.120/sipnab-0.5.120-aarch64-apple-darwin.tar.gz"
      sha256 "45489abba7c6d7a9fead99c7fc4299c5535765aa2911d49c088d81e07229abca"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.120/sipnab-0.5.120-x86_64-apple-darwin.tar.gz"
      sha256 "7f6dfd80934b6a98ad45b6b2473b7bb8d2702d569077cfe0ccc726228f286d0a"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.120/sipnab-0.5.120-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5ea3a0bb4b4f444257bf84204860c460b5eda807dc431315c1a98cdcb090f5b6"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.120/sipnab-0.5.120-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d85ff2df8098eaa6dbc71145f0310cc6c89c97f6e5cfa9b7b66654f6af333fa"
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
