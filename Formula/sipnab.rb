class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.128"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.128/sipnab-0.5.128-aarch64-apple-darwin.tar.gz"
      sha256 "5ee1a76f3d246ec9db0ce4db3eec9b37e600ed00f3cd186280fbc90f25663983"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.128/sipnab-0.5.128-x86_64-apple-darwin.tar.gz"
      sha256 "17f9f4c32ccb051e789fc029b7cba20facb72b267bea5c63e77eafc797053c30"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.128/sipnab-0.5.128-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bcabb82179484daa7f30a85ef0b2e1dc967a50301fc730f7878c08baaf3f2d16"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.128/sipnab-0.5.128-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b6f58733d72b92f3f7be13dcf77736b22b668818a5e3d9e79d713414ad0273ac"
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
