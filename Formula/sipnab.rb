class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.162"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.162/sipnab-0.5.162-aarch64-apple-darwin.tar.gz"
      sha256 "34295b449fff8557a79eafa7c0a32d90db1734008830b0f4094b487d71d3e5f0"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.162/sipnab-0.5.162-x86_64-apple-darwin.tar.gz"
      sha256 "ff1e018704766c8c090b78f098218a3b881a00f3f832069b8d4c814610063af1"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.162/sipnab-0.5.162-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "317e8e699897e508e0df1296510400edca00d92aba61519b3ce267822a1c5214"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.162/sipnab-0.5.162-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a81bc13aa5605c81760105e5b454c399c676be5411131cca47ce7b8cc0a9da50"
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
