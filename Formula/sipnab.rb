class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.184"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.184/sipnab-0.5.184-aarch64-apple-darwin.tar.gz"
      sha256 "55cbca269c5294cbc78e84fcfb60c738d9422e81649ea2b7f2d9f7943afc863f"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.184/sipnab-0.5.184-x86_64-apple-darwin.tar.gz"
      sha256 "30c9e19510b89ebed513097bee1213e1c4e3635e155fb77acefb6e1179e7b2da"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.184/sipnab-0.5.184-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "21c3a32fb7e7bb0989f4d7172048c62b4ae0e6e2997977817b22eafbdfa30a59"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.184/sipnab-0.5.184-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d7233a7c487cdc80de6b2cc99b0b1f5ef18ea7590e5f060c86bb24dfdada2fbc"
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
