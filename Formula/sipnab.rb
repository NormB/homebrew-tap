class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.253"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.253/sipnab-0.5.253-aarch64-apple-darwin.tar.gz"
      sha256 "3ebb43b6b3e9d61919bc2e0a879ad19f609499eaa2932f8ec2ce0edb6ef36ea5"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.253/sipnab-0.5.253-x86_64-apple-darwin.tar.gz"
      sha256 "df6405125c7cad3ed273c29dc6e3e98e20d9bf252f2500cda9fc6af2233a89df"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.253/sipnab-0.5.253-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "af15364c4613a223ac1e5964cb401b94dab85cc06d79c5403571693851dfd074"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.253/sipnab-0.5.253-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9bc4f3640f9e8e2a6ac2bc9ad5ba4d34b2d0534ee5fc3c92248fba7373e58f82"
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
