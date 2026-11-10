class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.243"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.243/sipnab-0.5.243-aarch64-apple-darwin.tar.gz"
      sha256 "3866e16b4276c10332476b3dc8daf7af12908dc63a5c5e7c55ad0de6c0d9fd17"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.243/sipnab-0.5.243-x86_64-apple-darwin.tar.gz"
      sha256 "0b2271f5bc37c0362727a1c3561022ce8b5231b4ca07007def2e3ab87c933638"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.243/sipnab-0.5.243-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1e51b598d91d3cc1bbf7059dacdecf95b548d14e016ca622502e46b059c40c31"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.243/sipnab-0.5.243-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e01a38f01696ce6564abe96c1a11e90c87baeb0c95438dc95afd0098d077692"
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
