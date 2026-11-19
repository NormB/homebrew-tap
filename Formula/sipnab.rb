class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.267"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.267/sipnab-0.5.267-aarch64-apple-darwin.tar.gz"
      sha256 "e5aacbb912a4a7eb65d727975e627ed609fc4f7a420364e6fb60d0c482fbb798"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.267/sipnab-0.5.267-x86_64-apple-darwin.tar.gz"
      sha256 "a5a2093c829f34c3997fdc45a92b8409dfdd48585f05511a09f5a23f8d9d9b0c"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.267/sipnab-0.5.267-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c7642d8637fb92e4145551e4d3f67f86a05d96664707839ac9dff70d7fc4bcd6"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.267/sipnab-0.5.267-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e775d3a0b33a91d4dca7c0f6fdc6576e4a7696fe06083c6a9b5dd63fc63d61b3"
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
