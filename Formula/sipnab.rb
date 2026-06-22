class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.4.7"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.7/sipnab-0.4.7-aarch64-apple-darwin.tar.gz"
      sha256 "8d043a86cb62c7cea3a66f89c6b2594d1a1ad8e2cf02cee4383c37b4cf2d9d62"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.7/sipnab-0.4.7-x86_64-apple-darwin.tar.gz"
      sha256 "ee13c0652160f52c328fbc609069aae1fc70b19a1902477e2ef0221b9f762ab0"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.7/sipnab-0.4.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "14227b6ecf595c26b70d45b77ce59c21407f02cfe9233ab2a586a5d0a619704a"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.7/sipnab-0.4.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "edf7cb87ec9c2558ae3537db464c5fa0139f4847435f2e1dde7ee83c5ef10136"
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
