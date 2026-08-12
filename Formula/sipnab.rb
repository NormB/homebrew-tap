class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.96"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.96/sipnab-0.5.96-aarch64-apple-darwin.tar.gz"
      sha256 "76984844348cf8ae41669502ba2422b9b3039370d0180a53ced08a523990a994"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.96/sipnab-0.5.96-x86_64-apple-darwin.tar.gz"
      sha256 "1b06292106c94e16313f0046aeb66be78bdbcdca7cfca24f882b6ebbc9299354"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.96/sipnab-0.5.96-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eddd1c7e18d7fffd9a18765ae1d3289a777ce4c8444110bb10da64fec3892f6a"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.96/sipnab-0.5.96-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ab072eb31e9bcc7da6070dc60bae95feec5ddf5a866de727392031a4c8e5518d"
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
