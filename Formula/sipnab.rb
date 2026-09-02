class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.143"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.143/sipnab-0.5.143-aarch64-apple-darwin.tar.gz"
      sha256 "05f4d890a31faf1d90a72e9681987d870013d5b07155a3edfae8e5704507b746"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.143/sipnab-0.5.143-x86_64-apple-darwin.tar.gz"
      sha256 "0b1a402186d4f9b335d23cb08264ce15632b5acbd03bbae533ec6e0597daba82"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.143/sipnab-0.5.143-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1c4b7871560df71dd3c2d12bd3a98e16ec242ee5fe2d685b9e9dc4b186bd1b51"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.143/sipnab-0.5.143-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1d7e5e4bced53077d9f21073946eef42650e0504626e1b7a412abe40b3511347"
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
