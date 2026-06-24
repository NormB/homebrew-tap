class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.4.17"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.17/sipnab-0.4.17-aarch64-apple-darwin.tar.gz"
      sha256 "977f7eebd4a48a9b5d9eabd8dfdab4e81648731f6ba2fc74ee302f3386f533fc"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.17/sipnab-0.4.17-x86_64-apple-darwin.tar.gz"
      sha256 "4d903af0400ac1d816b44b76b554f7c7b4bc486884dd4298b5eae20bc4020c75"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.17/sipnab-0.4.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6ea494275cad5292ce503fec5efa89770d5a9877e482892fd8a6dc687d450d90"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.17/sipnab-0.4.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "79604a7aefa43eafb237a752e53747639e283098b525754bb9ce9ebf4d09d985"
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
