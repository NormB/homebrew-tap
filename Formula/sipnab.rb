class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.52"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.52/sipnab-0.5.52-aarch64-apple-darwin.tar.gz"
      sha256 "ebf48c4d659e9c40b1ad72c1f1a9b42ae4b45a3132bd594a01259558251690de"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.52/sipnab-0.5.52-x86_64-apple-darwin.tar.gz"
      sha256 "c0f871e99fbc52ae4c9b597ce9fd745396fc67db6d9232e08348c2fe11406b35"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.52/sipnab-0.5.52-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bb311a9366ee3dc7e7dbc53501ee83eb08da45a3bdbd1f23a0f9ab8a136a317e"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.52/sipnab-0.5.52-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5b11a2f362175a9a51b831a837cdf7357f7f210f843a6e5c9cf24b50861d20d5"
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
