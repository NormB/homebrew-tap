class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.31"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.31/sipnab-0.5.31-aarch64-apple-darwin.tar.gz"
      sha256 "09994d52ac19e5a7906c44f4d03fe44ffeae08e8eab04693baf568fc5bd20db9"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.31/sipnab-0.5.31-x86_64-apple-darwin.tar.gz"
      sha256 "820f440578c268d4122e925253b093578a6828ffb66daeb37f25a28daefe8f5f"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.31/sipnab-0.5.31-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9db8a4219a51fbbf64c640faede97d9c7860b5a1ab6d51269deceb0c4555e52b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.31/sipnab-0.5.31-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "44d246f3d73a9da1a0ebf2da75c11daa9d4c985b74357e62e3e35e6e3ccddcfe"
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
