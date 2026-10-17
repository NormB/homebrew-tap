class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.225"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.225/sipnab-0.5.225-aarch64-apple-darwin.tar.gz"
      sha256 "3d8f4fc08b3b28e349935d7d9ddf8911f10e8c8a0a19c064092627e177be02fd"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.225/sipnab-0.5.225-x86_64-apple-darwin.tar.gz"
      sha256 "9ee0f66ef9f7e8a6a987f8d78cba9f62f3d98554c8ad8393511af8678fe359a8"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.225/sipnab-0.5.225-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "22d5f0bcfd311844a3b1c6459cc06420cae72712933ce383bd55c3f4f7401816"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.225/sipnab-0.5.225-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "765687e8fd203fdaca6686dbed4ee1caced7c964befdb79055c6f420d285b043"
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
