class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.9"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.9/sipnab-0.5.9-aarch64-apple-darwin.tar.gz"
      sha256 "9dc7d7c2fc26085ade2f45b825733e63a8dfa629932e45c3e0b494fd62456d54"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.9/sipnab-0.5.9-x86_64-apple-darwin.tar.gz"
      sha256 "55daae1e08119c898fc8ad93a114d9373cf0455fdefe59efbbfcc1e5618cb417"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.9/sipnab-0.5.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0cc939cf4b2fd44f674246b77f28ea6939beecfe39c5c8bbc8e90f7e5b877806"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.9/sipnab-0.5.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dd1055fa6cfae9be27872cc7d5f4a006484643febfd3451e0c0bb854215616e2"
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
