class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.6"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.6/sipnab-0.5.6-aarch64-apple-darwin.tar.gz"
      sha256 "a56c19d2fbab2a54b739cde126ac71e7cb7a5b92d74273d4553d1ee484a52cba"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.6/sipnab-0.5.6-x86_64-apple-darwin.tar.gz"
      sha256 "8d391306d9bcab7b12fe0a0325c584c1070046f1fe8f3e5840ee563cf224984b"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.6/sipnab-0.5.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5646b3b9441c418417ae077597874270b82f55081ea47008f141f820fb3ad60b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.6/sipnab-0.5.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3429ce574f67369e8efe54f72d51dd8fb0ed562161bd322fc5e780260dddf76c"
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
