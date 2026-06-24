class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.4.12"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.12/sipnab-0.4.12-aarch64-apple-darwin.tar.gz"
      sha256 "f2e75338987f056c149140a4510b7ed9685a642e32ddbd69336dc1712de9ce52"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.12/sipnab-0.4.12-x86_64-apple-darwin.tar.gz"
      sha256 "a0c0eca48b679eef07a5b12cf87cf69a96c7d0610d9ef06d8284c2d92f008aa9"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.12/sipnab-0.4.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7c204b824277349a363cda9139370285803c254f2a73d58a70e0ecad840c72a5"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.12/sipnab-0.4.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "59d18eaf882d68dca2b08ae1fd75fdffb5998cccf6f8a7c7423e1d4f9f665803"
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
