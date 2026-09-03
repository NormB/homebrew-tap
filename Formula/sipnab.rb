class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.148"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.148/sipnab-0.5.148-aarch64-apple-darwin.tar.gz"
      sha256 "92624e9d6731b08144869b4ab2769f4aae30551dd2a0c9537d8c0a900f605c13"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.148/sipnab-0.5.148-x86_64-apple-darwin.tar.gz"
      sha256 "e049d4ad989d22d3b4b4941d9aadc0ad2f56903fc1e5d4ac130d51d8efa96199"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.148/sipnab-0.5.148-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1118396fd53ca6f48fff61877de13b2a3df0f81a5f9280ac2cea1ffa4ca6c8e7"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.148/sipnab-0.5.148-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ceeb889a8a28bc7cd7591f0ac2a9dee5dd204ed108e5c4c161c2c63f54a2f2fd"
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
