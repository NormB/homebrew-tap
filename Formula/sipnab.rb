class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.172"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.172/sipnab-0.5.172-aarch64-apple-darwin.tar.gz"
      sha256 "60d96a09de44ed61e3147247c2dcc8a7bd94029eeb619512ebea1e0d365ad9fd"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.172/sipnab-0.5.172-x86_64-apple-darwin.tar.gz"
      sha256 "7358d5bd75e0aacbaf95afbbc63139d4d1e2067a38aa1b68fbe81becd6b14fff"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.172/sipnab-0.5.172-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e1156a3826d76daa580fa5c01fccdddbe2e7094859a38ebcf3e1f99716bf3ee1"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.172/sipnab-0.5.172-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "49453aa085273775df97912338f96d4b92caef118299b842abe6366768536130"
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
