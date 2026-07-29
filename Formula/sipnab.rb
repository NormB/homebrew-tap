class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.62"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.62/sipnab-0.5.62-aarch64-apple-darwin.tar.gz"
      sha256 "ff68e5a8d217b99ef778a7e26e63a0053613abeb9d07796f216e87a067ce12ad"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.62/sipnab-0.5.62-x86_64-apple-darwin.tar.gz"
      sha256 "bf9f003b9de2bba924906440993a5f31a9d13909b5363e2563e4e883dc786539"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.62/sipnab-0.5.62-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a0900b3bb9c8ca7e108450d47a60ffa2e5daf5a6dd273be4ed8c5343a405081b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.62/sipnab-0.5.62-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6f9180585068b6da8616ffae82b65d142b46634878ad3fa88f99d09868c72c65"
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
