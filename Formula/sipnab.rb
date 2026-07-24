class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.37"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.37/sipnab-0.5.37-aarch64-apple-darwin.tar.gz"
      sha256 "1e3667aecd351c9c263c0cf4a98caca6e7a09357155688caf46405a62107bac4"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.37/sipnab-0.5.37-x86_64-apple-darwin.tar.gz"
      sha256 "e3eec86eb1bd73bbffa61e017a3ba17a197836d5cebada0c53afe812da8d2d63"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.37/sipnab-0.5.37-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a16cce0ad418885a78951c0a4a99f8a30079c791984a8aceaf1e7b3cc223802c"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.37/sipnab-0.5.37-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "39f2db96e38ec74d03ef855719011939297952268923cb2eeffa75b36b95d2f8"
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
