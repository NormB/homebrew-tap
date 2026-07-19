class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.16"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.16/sipnab-0.5.16-aarch64-apple-darwin.tar.gz"
      sha256 "dd232d332edd60d34b81ffaed6292a6c8512babcde8172f8ea6bc5c957f9b824"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.16/sipnab-0.5.16-x86_64-apple-darwin.tar.gz"
      sha256 "f2a58e6b1bf061aabe278f89f60ce70f20112c6914e6334b601d752f99c25647"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.16/sipnab-0.5.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "55f6ef8b9ac49576bcda60a4b4645bcdb7f2d26ad358dd6c1a8cb09bea9441e7"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.16/sipnab-0.5.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "706019d9d67ff43f5d186e86b044797c21c09ec418d917e8ed5349b57820cc59"
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
