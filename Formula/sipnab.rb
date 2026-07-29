class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.61"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.61/sipnab-0.5.61-aarch64-apple-darwin.tar.gz"
      sha256 "f6af820ef2295987f1461c8b11c66a2b4b96c6d1d54de0f5dbfd39360fad0935"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.61/sipnab-0.5.61-x86_64-apple-darwin.tar.gz"
      sha256 "81144a91cfe55846507dd9172d814a236662568c2db4837ccf9b61c32e8c10a4"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.61/sipnab-0.5.61-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6fe91845aacf790989e5b5d84829551447d006ccd14d3c481599a1dbc2d1df88"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.61/sipnab-0.5.61-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "234e1ab2a407b0c9f50ace234eec7ace0468fca06b321587555025299f44d62c"
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
