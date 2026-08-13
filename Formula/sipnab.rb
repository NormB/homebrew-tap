class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.98"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.98/sipnab-0.5.98-aarch64-apple-darwin.tar.gz"
      sha256 "ea76d2642a08d21e1baea53a3c1dc2e5b91ff634d8965e75bf5a926e5850c330"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.98/sipnab-0.5.98-x86_64-apple-darwin.tar.gz"
      sha256 "fdca309712e779753f8efbd0a24ce0e5552d0dc7a8a1709923ab64d6fd8a96fd"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.98/sipnab-0.5.98-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7463e162ed8c539fc1a6593530aa1b88a1f24410e226218bf65e2ce7e58cf1f6"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.98/sipnab-0.5.98-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d1dcd187c2e11aae200943cf1c89fca423844d78d9d44124b7a277b49c1d3f8f"
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
