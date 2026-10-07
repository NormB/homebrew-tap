class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.206"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.206/sipnab-0.5.206-aarch64-apple-darwin.tar.gz"
      sha256 "1a12a877ebfdbac9664d91cb5db2098cc8879b6088e8ce0dbc79f6b873f44f16"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.206/sipnab-0.5.206-x86_64-apple-darwin.tar.gz"
      sha256 "e0547a581e4e39991da3b770273aee577345973dc5a4f03814d6ffc858c7d2c7"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.206/sipnab-0.5.206-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "47a64144e44b0c5986a57a0782256c8131699683b4b5ac7e7bf5ac2a1950ea68"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.206/sipnab-0.5.206-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4265adf3f9927c7d3881cce2aac4eaebae05bec74fa131607dee9536833b944b"
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
