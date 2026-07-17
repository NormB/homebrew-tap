class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.11"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.11/sipnab-0.5.11-aarch64-apple-darwin.tar.gz"
      sha256 "a565bd58da1783e4927fa7699cea561e7331d3cf3ae5496d37aae10808644e9e"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.11/sipnab-0.5.11-x86_64-apple-darwin.tar.gz"
      sha256 "46eba5b6a3edf1e1ad919609636ef69b572fe6395b2bcdd1aee8f7e8c0617f65"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.11/sipnab-0.5.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5b9ab5552c747b0bed7f8ef5f262d9edeec57e005ad8f9600edc59e6094d6bcc"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.11/sipnab-0.5.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c912431d64111443c308174225303a83067cf7e5ffc0bdeaa3c0e90c3717eb81"
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
