class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.240"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.240/sipnab-0.5.240-aarch64-apple-darwin.tar.gz"
      sha256 "789a0dab1fc6cb04cff40f6f78b50ad8d070b1b064241e38b5a12c5a651d4e0e"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.240/sipnab-0.5.240-x86_64-apple-darwin.tar.gz"
      sha256 "405419e553c57bb0a9b75edf8dbac3b36f70a158729579e5943f692256465491"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.240/sipnab-0.5.240-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7c01bab2a142d0f2ada164939a1ebbcd1644f41135161cbcb7ceb971107f3512"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.240/sipnab-0.5.240-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8a59de8efb55084b624eb12e22ab64b9a6b1155adbb85dfd3217b022236a0041"
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
