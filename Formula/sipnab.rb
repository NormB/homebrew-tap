class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.63"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.63/sipnab-0.5.63-aarch64-apple-darwin.tar.gz"
      sha256 "f128d279d967d6ea34d27e4b6cbc353af866332265482b17a86993eece8b79b9"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.63/sipnab-0.5.63-x86_64-apple-darwin.tar.gz"
      sha256 "7a79183c6166289014881ee0d1b71db3be2395604208efe80d7351152696a9c3"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.63/sipnab-0.5.63-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "72c729195eccf02999ae75e53fcb9d8264a70ab7ed17a5228bfc4766fefa4c21"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.63/sipnab-0.5.63-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "48fccc302483c1ffaf9355ae2e03f7e4eb75cd06cb48f422d8599ec8900f5285"
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
