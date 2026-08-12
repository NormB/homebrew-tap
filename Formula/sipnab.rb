class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.94"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.94/sipnab-0.5.94-aarch64-apple-darwin.tar.gz"
      sha256 "a8f761bff5be35cbe9ae7dac1529b8e0a1fb3f0b36f2c804053f62d3cb8c8e3c"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.94/sipnab-0.5.94-x86_64-apple-darwin.tar.gz"
      sha256 "5d7683319f02ae37e7e0a30b9123b8bafb8ed68f70c40f00692b6b0d260900a0"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.94/sipnab-0.5.94-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fc21f4a74ff120e287459ac1d48ef8dba91914eb8bd14422301eaa86b920a2ff"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.94/sipnab-0.5.94-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fb7a59652f38308c2672f5b626125ff855ab32bd0d7d008cd85c7a7e1a692670"
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
