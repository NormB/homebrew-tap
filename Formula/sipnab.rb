class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.140"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.140/sipnab-0.5.140-aarch64-apple-darwin.tar.gz"
      sha256 "9ad38580e25c2ec21628461c5929e1acc1cf730f0a5fbc74260c4fa448fa52b6"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.140/sipnab-0.5.140-x86_64-apple-darwin.tar.gz"
      sha256 "84b1d5f1272cb853786a88c0e5dbd8a7c6cb9cc0399396e0abda33ed858ff5ab"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.140/sipnab-0.5.140-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "22e5d712a6689d307bad25c8d06c9c9b7b5df1d742e7d58ee136f5b77764e4a3"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.140/sipnab-0.5.140-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "516123238b8b399fef3b51ab75af5545c0bb2bc58e3b91fe0de6246e4cd353e5"
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
