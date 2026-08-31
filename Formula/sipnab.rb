class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.139"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.139/sipnab-0.5.139-aarch64-apple-darwin.tar.gz"
      sha256 "818a7b382efccedcdc64bd0b2ecaf0ee53b1c73b042934d747d3c2fad1ec0a8a"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.139/sipnab-0.5.139-x86_64-apple-darwin.tar.gz"
      sha256 "0b0012c4d33a8d8d64807efef2fbaa94a8fa06e7b3ed4c512cf733b231891705"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.139/sipnab-0.5.139-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c6adc052f4d7cad96db70a1321c71546342abee821dfa0a7a0273f46715fd126"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.139/sipnab-0.5.139-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e69d1980dfbce96b87325ac1be87b18f52856b5281f51ff16dc1f6712fcb169d"
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
