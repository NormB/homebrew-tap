class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.73"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.73/sipnab-0.5.73-aarch64-apple-darwin.tar.gz"
      sha256 "57fafd0c4d8d972bc65a5ad0f4a7192e28f47e3358960552f19b4f6bfa6fecf3"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.73/sipnab-0.5.73-x86_64-apple-darwin.tar.gz"
      sha256 "fcd8baf891cf566166d19b75d7168c672d5cf8de01ca2a04ae4b78f5651879ac"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.73/sipnab-0.5.73-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "85812845f8d0e9314df4713363a75af0206c96535eee3f76a67e099c5d2ae767"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.73/sipnab-0.5.73-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2245c1a28d49b602b9749ef626f6b816c4659f9ac4d23a9103240915c060a38d"
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
