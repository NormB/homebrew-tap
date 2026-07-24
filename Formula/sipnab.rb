class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.36"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.36/sipnab-0.5.36-aarch64-apple-darwin.tar.gz"
      sha256 "6fcf329162e97d57f9e874c2c2aa88a4e83f8d410b8b6c1eb14f5b99d9c87fdc"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.36/sipnab-0.5.36-x86_64-apple-darwin.tar.gz"
      sha256 "a587bbb70ea4db2eee5197f4f269e794acfcf0b497585c5d7fbceefe4f09d502"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.36/sipnab-0.5.36-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3b8d42d8240b475d62252003292e07c1d86d3e78cf8020a6c68950be728371a7"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.36/sipnab-0.5.36-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c40e67c75e32ec324ae872a8d2de8009de45683266a1f126765ebd8c2c1fd9be"
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
