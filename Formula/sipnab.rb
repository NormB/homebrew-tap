class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.256"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.256/sipnab-0.5.256-aarch64-apple-darwin.tar.gz"
      sha256 "d914c5c4e9188fdbf665e013d668b389cb02bcc6c934905dcc726230d01cb022"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.256/sipnab-0.5.256-x86_64-apple-darwin.tar.gz"
      sha256 "0f271c3f85ccf464c0fcdbaf3f1e56022df6ead854f36062999d25bb66a99c91"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.256/sipnab-0.5.256-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "06fe734de43572883a07caabfc5e42e77df726f4137784e6a8be22b911d4f977"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.256/sipnab-0.5.256-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0207bab5e001da38e654777b53e8d79ad282f34d330949afd0034bbd7e99905e"
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
