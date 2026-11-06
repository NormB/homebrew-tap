class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.235"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.235/sipnab-0.5.235-aarch64-apple-darwin.tar.gz"
      sha256 "b9e30cdba203325deceff7f498a9db85dde7d7871ef60e157302f6d60b99e9e8"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.235/sipnab-0.5.235-x86_64-apple-darwin.tar.gz"
      sha256 "763553f788b08eb33ab7de050f915a78ad994101c79ea96648431b75e15e8c95"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.235/sipnab-0.5.235-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f0e79410fcd0e776b79bd2f7fccde50ef8edda1020f37fea833d19f7ce2de363"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.235/sipnab-0.5.235-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e006a6e78acf97d62f74995fc5e326c484597e843cbcbeffbabd86088b21476a"
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
