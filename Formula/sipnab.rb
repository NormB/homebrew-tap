class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.244"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.244/sipnab-0.5.244-aarch64-apple-darwin.tar.gz"
      sha256 "c78fea5460c421de4011ad67bb5b142aae338ef9ed614691d4ca8f8a099340d2"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.244/sipnab-0.5.244-x86_64-apple-darwin.tar.gz"
      sha256 "82783534457fb7adcea40f9240cf1df337d76fe978af243d35206f8c8b98c456"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.244/sipnab-0.5.244-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f54ae14dde1b4b5db45853f63dd6182f5b79120fa0ce917a43dd834255aed7c4"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.244/sipnab-0.5.244-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c0a6674a6bb558f27408506c4fea50cc9ae377ddfbf8ef44b00585df63876b69"
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
