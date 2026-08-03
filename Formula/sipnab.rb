class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.74"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.74/sipnab-0.5.74-aarch64-apple-darwin.tar.gz"
      sha256 "881c9820bfc433ac3ff3494f11ec6ea3f88029679b2708c754f86e166650d6be"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.74/sipnab-0.5.74-x86_64-apple-darwin.tar.gz"
      sha256 "e862104982283f099ab4eae7a0f57806412f4ad72440968aa687905aecfbefe0"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.74/sipnab-0.5.74-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "af7f80bcb9bad6235972e05cb2505ab853bae4d9424a08650250e1fec9e0a966"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.74/sipnab-0.5.74-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e2e344f055c98dfe6f9981843bbfbf2a86e10111842b5762933c6b457db552c"
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
