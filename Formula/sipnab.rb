class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.183"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.183/sipnab-0.5.183-aarch64-apple-darwin.tar.gz"
      sha256 "427de356f274146efcb9b8d8e78a3d8d51c0bb229ad095afb93884ac7bd22cfd"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.183/sipnab-0.5.183-x86_64-apple-darwin.tar.gz"
      sha256 "01443374ac84b782d2a1ab22ca17a4948ed9403c1d000dc4b37e2ab5d8d04320"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.183/sipnab-0.5.183-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1c9799d9fe90d770ccfcba5069f10732b92fbcfc428ef2d6282b17a15e4fd190"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.183/sipnab-0.5.183-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a211b3bec7c6cf0508ab4ebfe9748edf911a1cbec66e0b8289220ccde5278fb6"
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
