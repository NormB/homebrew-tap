class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.4.18"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.18/sipnab-0.4.18-aarch64-apple-darwin.tar.gz"
      sha256 "3fc5baf324e7c8d7bf4ca939c461fa21c896d642b4017392669ca60f763530e4"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.18/sipnab-0.4.18-x86_64-apple-darwin.tar.gz"
      sha256 "a8a630dfb58b4f70d98d0acca212a35b78ffae9b03bd900ef6b660d554506108"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.18/sipnab-0.4.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a0a7e3903b494a61acd3d74f60c9847031a3d5558c948ae7054be32525c16a2d"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.18/sipnab-0.4.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a4446dd5e393cabfb61d8f25952c67037b12536624563826248558637a910c79"
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
