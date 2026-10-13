class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.216"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.216/sipnab-0.5.216-aarch64-apple-darwin.tar.gz"
      sha256 "b276c5f710ddd519fac0e9cdc2766da53344eacf4ee6b9c1eaa0917de5abc439"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.216/sipnab-0.5.216-x86_64-apple-darwin.tar.gz"
      sha256 "e8bc45387560ba95302c6154347ec5076eeb274d8b7c096bc8baa1f0a6c66bda"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.216/sipnab-0.5.216-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "59db889bb0c1679d12c49a3ae66b8f47de134df7be760b87a6e5622a99964f54"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.216/sipnab-0.5.216-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "34b64b5531149cfab4fd92ed0f5685721e45e1e2037d178a58d64e4f7ab3ad1d"
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
