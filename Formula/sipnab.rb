class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.48"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.48/sipnab-0.5.48-aarch64-apple-darwin.tar.gz"
      sha256 "521caa2dd5562309ca5524e42ec9a1a222bf5ee592f0cce5fb628cb7a0d36783"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.48/sipnab-0.5.48-x86_64-apple-darwin.tar.gz"
      sha256 "060d99aa3ac97301eb5716b3fe41afa0d3e7bc1e24acbe09612cb7f716ae1175"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.48/sipnab-0.5.48-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1ba8fa4350660c27a9ee5d0e3196981fc6f7d7666e357f4200d397181e735569"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.48/sipnab-0.5.48-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "83e986be6a7c8513377249f100da7098ca4e179cbf6c3b968b02f06608468eca"
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
