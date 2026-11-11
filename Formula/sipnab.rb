class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.246"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.246/sipnab-0.5.246-aarch64-apple-darwin.tar.gz"
      sha256 "6da2b877d5ba1254e70c8402d1c5e8276118fc273b1fdebd3ea41131e216ed35"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.246/sipnab-0.5.246-x86_64-apple-darwin.tar.gz"
      sha256 "bca818d9e45da469a2e3f26ef7635f58b20212cf4ca247ef4296ff634a5fd950"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.246/sipnab-0.5.246-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "699d31e7ef09b3981abebcc7e2de7d7c3f6cddaae8dd163a02da30f82418c18d"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.246/sipnab-0.5.246-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "081a4b482250018f4b2d5f068ffb0f77537958022965f78bf93433622ef57e37"
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
