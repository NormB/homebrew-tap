class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.4.3"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.3/sipnab-0.4.3-aarch64-apple-darwin.tar.gz"
      sha256 "d1c0d9fcce3dcb79599e96efa317c7b2433128088bddeddb1065fead35bea7c0"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.3/sipnab-0.4.3-x86_64-apple-darwin.tar.gz"
      sha256 "17a1bda119ebf54ca5af286ae4c55becd0430648664afd2f5fede3eb439e6bbd"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.3/sipnab-0.4.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "858136ae7e3faca63d9521156e2f0897e389efbf81efc8bdcafe4511f215a5bb"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.3/sipnab-0.4.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f94435e79a5aaae1cb24050cc9ac7f94041588c845b425f2ca73750a8b89e3c0"
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
