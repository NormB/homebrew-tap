class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.68"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.68/sipnab-0.5.68-aarch64-apple-darwin.tar.gz"
      sha256 "4c7edaed632b16f77488c5961109d9899f164474954a2cdc007298fc03dc2706"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.68/sipnab-0.5.68-x86_64-apple-darwin.tar.gz"
      sha256 "5e27a3f0ee2677400b827f53cbd5fd697988b71fde43860b621838c741168f76"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.68/sipnab-0.5.68-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d932ab61daa7f9beaeb1b199176fed54cd26771e2af48ab81316c3f006b70f51"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.68/sipnab-0.5.68-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c9f1e9a30cdb4f407daf62887fdb946c1a382ac1fc476e007da080ab4eb977b"
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
