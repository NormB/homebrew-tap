class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.85"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.85/sipnab-0.5.85-aarch64-apple-darwin.tar.gz"
      sha256 "714d2a48548f11163f4958a98489746ac6944220821a2a0d03ef52f4ddc2d2bb"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.85/sipnab-0.5.85-x86_64-apple-darwin.tar.gz"
      sha256 "966069109bcffefc1f6627993cd1e43115acca3b4132b62b685d1ea8678c7c39"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.85/sipnab-0.5.85-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "86f72317325bd64dced58a667c64a361d569c1e5c83eeb4dd926787e1801aedf"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.85/sipnab-0.5.85-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e503099df017e66a80c0413b1e2b6c5d92027708398b14d5da6193ae9d68e98"
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
