class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.82"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.82/sipnab-0.5.82-aarch64-apple-darwin.tar.gz"
      sha256 "4ed257d81168cef4fac4b5ee3172ef0c0403d8a904030e68dd605c60008e6d85"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.82/sipnab-0.5.82-x86_64-apple-darwin.tar.gz"
      sha256 "d2c8959ccec1f31b76a296b3d76608fced7c894cab08cb29a5fcdf4d479cf5ba"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.82/sipnab-0.5.82-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3f7c893100d607497bf0cafd7a571f6a6b94bbfdb6ef648e21c2da7fa441fe28"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.82/sipnab-0.5.82-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f2b76cf339c5202f1d5fa108d3355749df9c157fec9302c48a6e6f625d0a24fc"
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
