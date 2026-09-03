class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.146"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.146/sipnab-0.5.146-aarch64-apple-darwin.tar.gz"
      sha256 "ab2694393cdd0dc7fb5f50e71f139a9d6a29cada3d1b2e2beb9e3586d1776db7"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.146/sipnab-0.5.146-x86_64-apple-darwin.tar.gz"
      sha256 "b91cd889f07fd00c560df39bab271be42645d9786533b9242990dd0281910f5c"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.146/sipnab-0.5.146-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "191937f11f8d6f8f48627466c72ea837b1e2ac467755c9102ad84922bc254151"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.146/sipnab-0.5.146-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d33d4da03bbb61e6b0905d7ae41a767a741ca19971c526dfe8d06653caaf7cff"
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
