class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.221"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.221/sipnab-0.5.221-aarch64-apple-darwin.tar.gz"
      sha256 "1d43ecd6f17e19e26a5e8a6eb2f72cb1c17aff015384f9c64535b86302118216"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.221/sipnab-0.5.221-x86_64-apple-darwin.tar.gz"
      sha256 "baccdaf2e8d1f78019d21903ac94e3e91945400ddd5462c0f1073e87368a7203"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.221/sipnab-0.5.221-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dea55930a9e8f7ae46abb84378cca7f29e1c733f6e1fa35e9ee9009b0c846a92"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.221/sipnab-0.5.221-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c518fb330237cf756f16232f314092a0c3875a4cef8eef380e4fdc5b965ee65d"
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
