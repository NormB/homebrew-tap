class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.33"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.33/sipnab-0.5.33-aarch64-apple-darwin.tar.gz"
      sha256 "1219f474065dc7b6e0ff6889af20ab6909b183c9a5af9cfcb11066300481db60"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.33/sipnab-0.5.33-x86_64-apple-darwin.tar.gz"
      sha256 "5b248bc57b3782c749f500ee59adacce52ec5e85ccfb34b67599e095058dfbea"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.33/sipnab-0.5.33-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9c97618798adb1de2ed187b5163123a7d563ab68635a9ef0bf47642c17c6361d"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.33/sipnab-0.5.33-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7534a6afac0de4043986331be418bbe8871364bf521aa2d4194c91589ba90c4b"
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
