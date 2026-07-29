class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.60"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.60/sipnab-0.5.60-aarch64-apple-darwin.tar.gz"
      sha256 "a1d28b54a1e60262c02ea688b45160e9548aecbb2fbbf58641cb29ac986b7e39"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.60/sipnab-0.5.60-x86_64-apple-darwin.tar.gz"
      sha256 "3b684c89631d588d4931966621bb9a4081f32882868dab011d690f71ebb0644f"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.60/sipnab-0.5.60-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c92774a6e4a27561a7515e36de67b288778fd3bae65a4f6ead865d8aee14be11"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.60/sipnab-0.5.60-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ef61c4329e74584bb1e6d4288e15a6c7cf20c24081dfb47d30f7d81187625589"
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
