class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.4.19"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.19/sipnab-0.4.19-aarch64-apple-darwin.tar.gz"
      sha256 "62afec6533a8cc925bf4551c14b9fb0d9677dfbf951971e001722383fbd34cc2"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.19/sipnab-0.4.19-x86_64-apple-darwin.tar.gz"
      sha256 "9cc3ed556bc268ea1e701620ecd913f073beec4125b750aabe07acb20f42f9aa"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.19/sipnab-0.4.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3c46164bd60b3b70bceab73139e4d7fef044cac82d4bf645b64a13cc4024a11a"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.19/sipnab-0.4.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "edd619dcd1e27d64565d3d1ad9da4adfba6f841cbd257bae3c79b030fe534a22"
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
