class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.23"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.23/sipnab-0.5.23-aarch64-apple-darwin.tar.gz"
      sha256 "f4cb2bc13ca708a77eb072c2842a7226cfcd7b8bdd9ae8fa2d4b9ba322f34a44"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.23/sipnab-0.5.23-x86_64-apple-darwin.tar.gz"
      sha256 "f4a36e3c64d0ba6e8b6c81b8b805ad393f28d02be0d93ce4d5e0da487142127d"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.23/sipnab-0.5.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "af14b8a49aff7f164ccdfcada3980d7765b92d154922bda072a67b1a7584f9f4"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.23/sipnab-0.5.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "13c6c133169d6aebbca31537fece7354295d3237f66106e8a4063391f36fff5c"
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
