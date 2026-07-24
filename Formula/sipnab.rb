class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.30"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.30/sipnab-0.5.30-aarch64-apple-darwin.tar.gz"
      sha256 "249e97cf64ec7d178064892f036a50fe2a97324b41cdfe46d61772fb01b2d209"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.30/sipnab-0.5.30-x86_64-apple-darwin.tar.gz"
      sha256 "a72e429eba4ed8bdc2253c020234e2502bf7bc760ceedf4b967ee3696537f168"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.30/sipnab-0.5.30-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6698cb98fea490459ec1680b093b5d24b8faf2c3dba7e5fbd45862a1a0ee289a"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.30/sipnab-0.5.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7487b06a1725f5f8f054d94da8a7e6534814044f757fb0b106480e64eeb42e5d"
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
