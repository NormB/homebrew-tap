class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.200"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.200/sipnab-0.5.200-aarch64-apple-darwin.tar.gz"
      sha256 "3a6618a6ba18928bb59ff38452c904e11c1b8c7ed092aede66f4cbc4981474d9"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.200/sipnab-0.5.200-x86_64-apple-darwin.tar.gz"
      sha256 "6f2862c0802a388ae8eaf3637d7885ac9d20c14f90e9abffe67eab9ce23d4741"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.200/sipnab-0.5.200-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6c1852cc6121a56b5c1a1002e9e3b390fa32e64776f8d550f77cdadcaced0398"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.200/sipnab-0.5.200-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dc85ec072eb37db184266ba13c443c4dc7f7c55899339f8ef7eb3189d6567fba"
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
