class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.28"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.28/sipnab-0.5.28-aarch64-apple-darwin.tar.gz"
      sha256 "4806be63d76f10820bb302ac4f6a62cfd3405468cc0ed3b1e8dbad14fded400f"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.28/sipnab-0.5.28-x86_64-apple-darwin.tar.gz"
      sha256 "2b6d5cf3a96c46b2a13871f5d18083930bbaec9144c91647e986875455df01f0"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.28/sipnab-0.5.28-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a97c861d4ff19bfb3053c82cec9fe7f07e7e2eea56a6ee6edf804fb9ea482ba1"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.28/sipnab-0.5.28-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aa627398121d7544688c1348076596784a4f7c19d7405ec39956dcfbf4709205"
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
