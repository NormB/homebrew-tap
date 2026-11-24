class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.270"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.270/sipnab-0.5.270-aarch64-apple-darwin.tar.gz"
      sha256 "39fd96f42342aa0f9af8fa10cee3b5e5f86507f9e3f1cab863d9195ae5791077"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.270/sipnab-0.5.270-x86_64-apple-darwin.tar.gz"
      sha256 "4d5f47ab66d17b01ac61cd8bbb1f811c7691627047d69ad7fcba66f5bb6d8192"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.270/sipnab-0.5.270-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "838fb968115aea5d0fd49c4eecdaf32aec0e631ad30e5625c44fea10601c70ea"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.270/sipnab-0.5.270-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d9067c813e5262c4aa0c861299550d2384f08b6d578b26de4fa46295019aed5b"
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
