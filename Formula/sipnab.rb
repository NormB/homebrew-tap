class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.255"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.255/sipnab-0.5.255-aarch64-apple-darwin.tar.gz"
      sha256 "a6c67844f612a78f1a278e5a37b1b4b74b618ae2614954128a09a6ba59a0aa69"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.255/sipnab-0.5.255-x86_64-apple-darwin.tar.gz"
      sha256 "b073ed7fc7b6656a0fb170e2cf87d4e602afa8df400eb9bdb70623a28cc3902a"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.255/sipnab-0.5.255-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2e9eb2dc5fd14a5ec51054b933a867cc3300296a15bb6a387b469a560db399aa"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.255/sipnab-0.5.255-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "12039415a0dcb57b1d30b0b30e5131e624675a94ca03d109d1030f9b531022d7"
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
