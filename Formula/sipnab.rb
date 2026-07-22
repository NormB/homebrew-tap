class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.22"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.22/sipnab-0.5.22-aarch64-apple-darwin.tar.gz"
      sha256 "49232019834677fc420677a1527097df58981def8f555af68b8cf35e759386d5"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.22/sipnab-0.5.22-x86_64-apple-darwin.tar.gz"
      sha256 "42a700e06a11ab2706dbdfe8081b24494757ea47c3d00275e5591043eef2a13e"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.22/sipnab-0.5.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6fbe2b5c5defe9569d3ee8983045c87aa5bbb1d16d9a928370276addb9a51d75"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.22/sipnab-0.5.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a38353e1cdc4a7b90f62037826bedefc4749c1ac9c91737b48f75c905be0271"
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
