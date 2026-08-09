class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.89"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.89/sipnab-0.5.89-aarch64-apple-darwin.tar.gz"
      sha256 "6211ec42f624d4ed868845b16e182f7b3cb0a604633189ec1bb8bdee6a6198d0"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.89/sipnab-0.5.89-x86_64-apple-darwin.tar.gz"
      sha256 "d6bff6238576254fb5c40d249f9541d1795750e7b049d63b7ee969d637159aca"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.89/sipnab-0.5.89-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f4bedb79365e7c405208d4f29ee9407d984f8ff1bdb694531960610fdaa710b9"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.89/sipnab-0.5.89-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "10aacbf6315dbd29de91dc169732385b887e067345b3ff8e411a3b008ba761b6"
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
