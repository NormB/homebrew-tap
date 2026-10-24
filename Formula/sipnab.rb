class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.229"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.229/sipnab-0.5.229-aarch64-apple-darwin.tar.gz"
      sha256 "2c57dfdd069638d29c717c39ee3be204a65f15d14358b490c2cd28ce8a187410"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.229/sipnab-0.5.229-x86_64-apple-darwin.tar.gz"
      sha256 "d652861bcfdeaf3f4604e438ddb0fe08606eaa8f443e82a64c39976a5f873a34"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.229/sipnab-0.5.229-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4a5ae849d52cac8717c197f06a319848514df7eef5699a57271c84f6d59979b6"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.229/sipnab-0.5.229-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "72f6122041021b45d570834962c060b38a6891dabf5af5ec7a8e2e903d2b3a6f"
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
