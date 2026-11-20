class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.268"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.268/sipnab-0.5.268-aarch64-apple-darwin.tar.gz"
      sha256 "6d5336294b1680ad1fab37b79493f70febe90482e8e08c2a90be892bd32978ab"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.268/sipnab-0.5.268-x86_64-apple-darwin.tar.gz"
      sha256 "504238d916b23341111e20c8f9f0aa398aed549f0f0a7ffd77317baf095dcffd"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.268/sipnab-0.5.268-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "07da06f6d9cfc3e09ff52b3e7cc35f819a83f908c741deec5eee781af0b17267"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.268/sipnab-0.5.268-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1057c45d6365f30dd1acf31aecd0b4ff54941072158e267372e5ce1fc743b12d"
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
