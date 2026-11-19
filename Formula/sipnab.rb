class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.266"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.266/sipnab-0.5.266-aarch64-apple-darwin.tar.gz"
      sha256 "b74157c91c71ea38a7fbdb66110a11a4c06984cca3ac5edb97c5c9af61728bb4"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.266/sipnab-0.5.266-x86_64-apple-darwin.tar.gz"
      sha256 "9ea5bfb3aa5c9e0c72bf3cec10ecd806c2a15e2af7901d576403b95ca264d30e"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.266/sipnab-0.5.266-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2a905ec20503ff15ddae4b9d814aee876386267c4d08a3ceca6388224d5ab60d"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.266/sipnab-0.5.266-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eb1b20bf9ffacfd41a1124597c6b1cab819fecc528c1d5d783d695872ef51e87"
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
