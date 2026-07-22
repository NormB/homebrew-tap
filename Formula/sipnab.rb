class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.26"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.26/sipnab-0.5.26-aarch64-apple-darwin.tar.gz"
      sha256 "98125e491acb476ccd7609a024e173db791bcd61580534ac157ae986415454d4"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.26/sipnab-0.5.26-x86_64-apple-darwin.tar.gz"
      sha256 "85eb6e2455c68cdbe749f563685f49d6376dbe770e4cc383ad6feed94459382b"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.26/sipnab-0.5.26-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b3b6c158eaf40828b8a52adb46ab688d7d31da91d777a0df3af6b8c50e513bf6"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.26/sipnab-0.5.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "02b67e17e66d31d219b3f5448f66d0708d27a12b469287ebbcdeee7d0cdc8603"
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
