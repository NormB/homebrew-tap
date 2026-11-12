class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.249"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.249/sipnab-0.5.249-aarch64-apple-darwin.tar.gz"
      sha256 "0945c83e6e3e9d40d23609173f5c1ddf4175f0f269a26385e505ff077b1aaf1b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.249/sipnab-0.5.249-x86_64-apple-darwin.tar.gz"
      sha256 "bcd83268cdb2ad97f17fe6754b9eae0d76ed293f7991ec913c9fecaf8e76acf7"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.249/sipnab-0.5.249-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e696596a8e6dbfb1f47d9acf23b56ca570a7f0fe4c9d06a36877d84e98fe618d"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.249/sipnab-0.5.249-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d4d948069f1abb5dc4e2cd2e408d89bbf87529ee56bca27abe0b785c441708c4"
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
