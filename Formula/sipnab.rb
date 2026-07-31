class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.69"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.69/sipnab-0.5.69-aarch64-apple-darwin.tar.gz"
      sha256 "8c6d62d1096ce0d2df1c410b966022d594e72a63bf2dec95136496830057734d"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.69/sipnab-0.5.69-x86_64-apple-darwin.tar.gz"
      sha256 "b2373ee4856a3c3217f9984afdf78837f70c508a7b1d469a23d1389783318a05"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.69/sipnab-0.5.69-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "37787b6528f8204fd417732403fddc66afacbff75cbfb212c57670bce3df2bd5"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.69/sipnab-0.5.69-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3ceab42d2d85422516033823dc1dd5b0eeedb57af882c2b642c173b5e5a18b4c"
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
