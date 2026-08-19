class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.112"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.112/sipnab-0.5.112-aarch64-apple-darwin.tar.gz"
      sha256 "87341663b70bc1cf14e30db2f2ce67c25c4e734a71f4f611addc3f89b04e9e49"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.112/sipnab-0.5.112-x86_64-apple-darwin.tar.gz"
      sha256 "a4fabbe37ed4fd61eec883b8dc845a83db2c717f652628596d7b06edaf3e86a6"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.112/sipnab-0.5.112-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8457586601cd2cd21ee348e55dbf2db88dc8e00624bc826bad3c5ef966af3d2c"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.112/sipnab-0.5.112-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a66bec5ed8cbf5cf9ede4dc6c00010f77e3eb12c22e895f1fc48eeee0fb50c3c"
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
