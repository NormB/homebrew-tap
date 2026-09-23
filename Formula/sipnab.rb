class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.186"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.186/sipnab-0.5.186-aarch64-apple-darwin.tar.gz"
      sha256 "0656c52b70f09cee7c54396322f15fc4bf46d82b9ee816353c439aeab27326e3"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.186/sipnab-0.5.186-x86_64-apple-darwin.tar.gz"
      sha256 "9a50199e38c2d43607a75fc50d96a2c3dea67c49890f30d39dfe074b70d8578c"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.186/sipnab-0.5.186-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3095908ce5b0f3ce0fd172b9ad012f4f2d14a56f339a72c9c02cb97822ce6517"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.186/sipnab-0.5.186-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ca4b4fdbcd173a63ce053f08f75af1a53bc1605f4a4802dcf6abda25610124d1"
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
