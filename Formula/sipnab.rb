class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.90"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.90/sipnab-0.5.90-aarch64-apple-darwin.tar.gz"
      sha256 "230f53ba104e568bb9174d2e0bfa1ad979808132fc2f66d1d85d40fb01f8d590"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.90/sipnab-0.5.90-x86_64-apple-darwin.tar.gz"
      sha256 "de1209e1d624b6adb54cc0baa61e0ac60923dd78600f3b1ba65526d2e2c0aece"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.90/sipnab-0.5.90-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "41525f899c744d745cbfdc1ab2a4c61b05df2b7a8740eb24818853381dd46d9b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.90/sipnab-0.5.90-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f73c6c49492c11c50c77800821080c127de586c32176e771cb1965713c377c97"
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
