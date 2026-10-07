class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.205"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.205/sipnab-0.5.205-aarch64-apple-darwin.tar.gz"
      sha256 "2d875dfd2c6d660d8d4d1c5567cc43ffb0cabc9e50966d2338031c34e23155c9"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.205/sipnab-0.5.205-x86_64-apple-darwin.tar.gz"
      sha256 "11e9bf8596fbaa9cec26487072efe91675a90e3fb4500e81925eb16ced1a22b2"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.205/sipnab-0.5.205-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ea50ae478ff808fc170854bb1fb9279a680831f58385f6382d8c86c20ad38818"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.205/sipnab-0.5.205-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f74c85d7e6f1c4fee8adbef9128cfb2b0c794eb879bbc05fde7525592420871f"
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
