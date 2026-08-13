class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.97"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.97/sipnab-0.5.97-aarch64-apple-darwin.tar.gz"
      sha256 "08e21865ebd1bc008bb3cfb020d1dec1f33c3f9e79120cff2b82a999ba61fe56"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.97/sipnab-0.5.97-x86_64-apple-darwin.tar.gz"
      sha256 "68b8c707caf88050f8d808a0877d942dcc6276b124a71522a566e02bba5f532b"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.97/sipnab-0.5.97-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3725e7e77d94805f14bcb521257405174a9c99387895ba54a1a13f6cb1d72b3f"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.97/sipnab-0.5.97-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "445c4738a813937018d2730d584dced559ed0a59634f11882d9debed21f5ea06"
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
