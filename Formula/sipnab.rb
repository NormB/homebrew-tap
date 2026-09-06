class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.154"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.154/sipnab-0.5.154-aarch64-apple-darwin.tar.gz"
      sha256 "5fcff489fb5e6a51533a4ba0a2534ff30d1e3bf0e88c3467c9c561c93f021a94"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.154/sipnab-0.5.154-x86_64-apple-darwin.tar.gz"
      sha256 "02a0fd0466ba69dff7e2f98da7de1bcbfbe46e178f4313c9464a2a81966975ef"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.154/sipnab-0.5.154-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c2c842e19a112e43da9a60708b9c2b0de33b8f59a34993bb61185e1c4451c9f8"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.154/sipnab-0.5.154-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "083cd46ae85a81cae6da5b0a6eb226e818c0ad2e40a74460f2a3aa65ab02aae0"
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
