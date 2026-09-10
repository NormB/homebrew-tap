class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.164"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.164/sipnab-0.5.164-aarch64-apple-darwin.tar.gz"
      sha256 "2ef4127c0b5cf47ccbbb0683400f46a55bd179d87c48503934045a9b09b62e3f"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.164/sipnab-0.5.164-x86_64-apple-darwin.tar.gz"
      sha256 "46f2290fbb70c41c4fde32165ba9b814474706c5a97d5278cf6dccf906fd2289"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.164/sipnab-0.5.164-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "346e5b1a7a3526d4ffb5a54e0c1ec79ebb956754b4fb44dc49966495756121f3"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.164/sipnab-0.5.164-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cc0d58aaa948c20289ae49afb762808d95d07fb021bd017ee062cb9d04a59159"
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
