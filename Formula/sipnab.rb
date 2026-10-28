class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.231"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.231/sipnab-0.5.231-aarch64-apple-darwin.tar.gz"
      sha256 "51cdeb9bb70563a48a81c878967dbe77e092d68c3358f573fa76ff3a4d722dbd"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.231/sipnab-0.5.231-x86_64-apple-darwin.tar.gz"
      sha256 "60b20be49f10ea2af4650eff65014899b2be62c901968fe78215fc1608324d34"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.231/sipnab-0.5.231-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1aaf85f3af3d1c16b94c79c0decaba8aa543ac4904b54a8ed279d807b2bcb8d8"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.231/sipnab-0.5.231-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "797c3198bafb3344431fcc97dc9d31fc0789f7894c2f2a74e78ac0bab196e030"
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
