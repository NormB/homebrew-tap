class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.3"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.3/sipnab-0.5.3-aarch64-apple-darwin.tar.gz"
      sha256 "f744a002f97014843520481ee8996bb2724dc796559bef4c359382fc91d54dad"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.3/sipnab-0.5.3-x86_64-apple-darwin.tar.gz"
      sha256 "d9f74e4209e1e7a295c4edeb4e53cb84196bfd7d3d87865905105aca9cf51f3e"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.3/sipnab-0.5.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "498fb6970cb3a3a3c61fe1ec83e336e4031e48e47ecdf26ca45fcf129df6df19"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.3/sipnab-0.5.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c5bba4b86a233e0d0d6ba1e1b571fd7e83dfec5b9e515b64368b01490b2e7fa1"
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
