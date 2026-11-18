class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.264"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.264/sipnab-0.5.264-aarch64-apple-darwin.tar.gz"
      sha256 "e836c0bec00088cc39df59598cb5448649b1770f6f6a6402e3cbdcebe620f734"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.264/sipnab-0.5.264-x86_64-apple-darwin.tar.gz"
      sha256 "3f1dd306e79263e4b6a106cf09935450f8a1908663d1f764fa0c5282468b17bd"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.264/sipnab-0.5.264-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6a07ce29ae602bb24b81fac9e63db3b3a15c9e3615ab79c5dc718ad5d0c65525"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.264/sipnab-0.5.264-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "58d12dca81d28522ed7dc235af52e761fcd7c0908735c2b5c89954451b217abf"
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
