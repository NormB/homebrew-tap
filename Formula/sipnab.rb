class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.191"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.191/sipnab-0.5.191-aarch64-apple-darwin.tar.gz"
      sha256 "646e763bf5846ba4092fb7b283e09382628469a8f7d357f96c1a1ef9aebb558d"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.191/sipnab-0.5.191-x86_64-apple-darwin.tar.gz"
      sha256 "092f40a1bd9ce2a30bc12edf45ee8e0efbd0a7bd15edf3645c411a7fc124731a"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.191/sipnab-0.5.191-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a33e78a7a998d94e1d0ccd6e54935dafb53beffd9ba046e8a0c10f4cfb783495"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.191/sipnab-0.5.191-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1b79f6c5c340fda13bfc628628aff36bfc69980a24c908ba3058973768576d0b"
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
