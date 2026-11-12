class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.248"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.248/sipnab-0.5.248-aarch64-apple-darwin.tar.gz"
      sha256 "cc0cd512e719ed1c9148485c4a638a773c6ce69fd5554b849d6f7db618a40ada"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.248/sipnab-0.5.248-x86_64-apple-darwin.tar.gz"
      sha256 "8dd2338664ca88b703f83fdd82049a04ca5d1e6b721620d2358e600f79bd28e7"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.248/sipnab-0.5.248-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b64b2cded67e73cd3791e54737b0144e3d206ee49cfadc020318950fa0518a59"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.248/sipnab-0.5.248-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d0317bd021a2f3e90ca4c30732ba196f6300abaf7f6a469729e8350f20c7453c"
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
