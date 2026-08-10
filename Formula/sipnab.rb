class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.91"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.91/sipnab-0.5.91-aarch64-apple-darwin.tar.gz"
      sha256 "ed7acaef159ca175c4eabc0d76f5625078a409eb76fbfbdfb1763fea288f0341"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.91/sipnab-0.5.91-x86_64-apple-darwin.tar.gz"
      sha256 "250289a2b1f113d972a3e6b7f9d18ec7b0f51dd02cd4c185b999ba9bbedc03f4"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.91/sipnab-0.5.91-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "943f71442d3f290a1640fe6d9d1323fe9236b18e5c277e7600301be2fad30897"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.91/sipnab-0.5.91-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "562bd677c182331cb98de676bd8195c344c90c13ee6c36133c97d75b0647746b"
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
