class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.53"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.53/sipnab-0.5.53-aarch64-apple-darwin.tar.gz"
      sha256 "5046c1b6046b4a5c22f867375265077da80e3a8ef61c5829ddcbf52367db9bd8"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.53/sipnab-0.5.53-x86_64-apple-darwin.tar.gz"
      sha256 "23b2c744c84816b932e64707b85f11fd75a6b4782d50594feeea0d5a1bec889b"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.53/sipnab-0.5.53-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8f206833c3d2c01975a7e5b5ecb440785199726e35d6465df385d8696348c718"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.53/sipnab-0.5.53-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8f9d9ac265b2c7115a8a37a5d7ec4c2bdba11821cd3e1ae8f608d9e09b6f60a6"
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
