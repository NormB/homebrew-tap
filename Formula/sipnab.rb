class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.4.14"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.14/sipnab-0.4.14-aarch64-apple-darwin.tar.gz"
      sha256 "61ef5e231280694a91ee72c62affa5db8346369b139a2092175a587aa6dad4fb"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.14/sipnab-0.4.14-x86_64-apple-darwin.tar.gz"
      sha256 "14dac8bfcf5b666de0dfd6a7c85a575c3a8178cecb4629e977841f40a42e160e"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.14/sipnab-0.4.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5183f332584da42b27792b8c07a98b602b0efbfa4360d4e8089c29904234dbd5"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.14/sipnab-0.4.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "79be783b1f77408358c00cb8dd5e239de680be4a6b93a636372d83a799d4ab40"
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
