class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.241"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.241/sipnab-0.5.241-aarch64-apple-darwin.tar.gz"
      sha256 "6ee95e1627077104ec1a4cfb390fb0ba90c84f7ee09947ac6678f96ca31bfe75"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.241/sipnab-0.5.241-x86_64-apple-darwin.tar.gz"
      sha256 "79cc3843b7730327fa0af040d9757122df2110dae8eeec18a7c877fecfdf5311"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.241/sipnab-0.5.241-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0722cef31e37187064efa647b84adccfb2b1d422999f2846b70862f2cb4664c0"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.241/sipnab-0.5.241-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6ef39ab48f4750cc2d7d309b7fa820545c471acc8e79e455a093adda43f72f98"
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
