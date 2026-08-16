class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.103"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.103/sipnab-0.5.103-aarch64-apple-darwin.tar.gz"
      sha256 "2ef8eb4c0dde33fbd278f2f2f604b9d49244e506aa921ddfd3597bc1c6e33877"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.103/sipnab-0.5.103-x86_64-apple-darwin.tar.gz"
      sha256 "17969652d030a94af1119d53253ea201367c9776aa659100f65fb1aab47b9073"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.103/sipnab-0.5.103-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fe48742ae67a070df450dc0015219d64ecb067d8f1b68f9a0ee92e08e7fd8add"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.103/sipnab-0.5.103-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "630461ef286f2345afd36aaff7b059972c7b6d217cff055c70b3e8be2f57947a"
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
