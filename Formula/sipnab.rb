class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.182"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.182/sipnab-0.5.182-aarch64-apple-darwin.tar.gz"
      sha256 "a726bd6aa35b7bbdac9dd62d8a426aa4c3dbaa8ed934699451af156ba30bd2f6"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.182/sipnab-0.5.182-x86_64-apple-darwin.tar.gz"
      sha256 "b639ad37351e3996c59f57f8d24091c21466a6b4672ec34cb537e48b583ac24e"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.182/sipnab-0.5.182-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "77876bbdc1d0922c484e09aee604d17f35c7efa7221f9b8c888653a32cccc7bc"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.182/sipnab-0.5.182-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d9224a282e5a6c84550d92cc5646ccd4eaf90c1bce373e952ef1eca5dcf1ecf6"
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
