class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.118"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.118/sipnab-0.5.118-aarch64-apple-darwin.tar.gz"
      sha256 "3ec61b2807f717ef0666849bfbfdd1893a9e9dad14414554aa8fca237015b4f8"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.118/sipnab-0.5.118-x86_64-apple-darwin.tar.gz"
      sha256 "ca9ca0114d8437610fd605ef919fe5fc281324bf944a66f796565c68e78a79e9"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.118/sipnab-0.5.118-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "88f3f8714be10611f5db138545c2a154abefddd3a0fa7df2be45c5a00c78a9a6"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.118/sipnab-0.5.118-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bbac5f27ac70f72390ccdaa558f4d49aec994947787438dcc657fc98e24b39c2"
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
