class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.77"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.77/sipnab-0.5.77-aarch64-apple-darwin.tar.gz"
      sha256 "14706f30965728345d978402389ac015cbe1579c55653a97b19fddbdf3aeb657"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.77/sipnab-0.5.77-x86_64-apple-darwin.tar.gz"
      sha256 "c13d4228b1e6ef09a2e8ae2363aed08cdcbfbb4495f7c0b91c7b3774d9ebc0b6"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.77/sipnab-0.5.77-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9b2e993611aebfa511ff917913be00c16a9296b404b49d8375076cfbe5b5f3d8"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.77/sipnab-0.5.77-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d340bc6913bc2bd22036aa2f90c8ff7448468fe1fe7434546c700ef7e97d263d"
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
