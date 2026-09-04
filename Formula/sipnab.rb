class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.150"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.150/sipnab-0.5.150-aarch64-apple-darwin.tar.gz"
      sha256 "6ac2f7496706ca0b458e2839c11b7d40411a440257475a826d671c63ceecc503"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.150/sipnab-0.5.150-x86_64-apple-darwin.tar.gz"
      sha256 "72db19fc36f83fa8b2c377357614caf0e65d266d4e05b7878d2fb51f609fd92c"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.150/sipnab-0.5.150-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4e9f3bdf4a26c47225921f67156e03136df84c9d9f4838b13bbb7a6d93e14a79"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.150/sipnab-0.5.150-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1f97aadbc7641cadbc6b982a7612a0194f3b5e0278d9fcfcef4c4f282ff348d9"
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
