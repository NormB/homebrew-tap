class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.34"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.34/sipnab-0.5.34-aarch64-apple-darwin.tar.gz"
      sha256 "1af2636185e6fae1acc366af3179f6b08daa51b4dbce9c41b1eb2fc0e78acb4d"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.34/sipnab-0.5.34-x86_64-apple-darwin.tar.gz"
      sha256 "dfa3d337d9e9ea759bcde35abc55deb10cfbbd9f958f1b8a55ccee0ddcb00f71"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.34/sipnab-0.5.34-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "876cde23876f260895be10f52f8a64fe48c5fb2916bee01da1d326bdee7209ae"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.34/sipnab-0.5.34-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "75e045b8211ac9d60a6b14f70e54d5109d0d17a7a86bff5fe62f18a3b9d79e7d"
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
