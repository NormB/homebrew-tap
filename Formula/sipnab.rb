class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.196"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.196/sipnab-0.5.196-aarch64-apple-darwin.tar.gz"
      sha256 "13341e1965a9fb5deafb4211461a4cf4b7e532da79fb6432c6af1e4e9a902ca0"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.196/sipnab-0.5.196-x86_64-apple-darwin.tar.gz"
      sha256 "e4a25935311dd0b39583a367a43e70791a0e66eca73def9ae57f2c2f3485636e"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.196/sipnab-0.5.196-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "28db1fe36a81fe6dfe00f2c7cd0478f736ffe03739b0d826748bb2ea6e832926"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.196/sipnab-0.5.196-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9743169fd2c42381b4d4b640157452ec1f62d43d032c79b170df0d1041097af2"
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
