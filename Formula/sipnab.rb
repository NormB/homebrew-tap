class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.4.5"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.5/sipnab-0.4.5-aarch64-apple-darwin.tar.gz"
      sha256 "191b0592c1d283bf968ca67eb98248af004719fe2184211b9f92830689a84b54"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.5/sipnab-0.4.5-x86_64-apple-darwin.tar.gz"
      sha256 "0d442458750bebbc21cc8e35e42260e29d43608e287872dd91ff39a3cc67e181"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.5/sipnab-0.4.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "97303a927d47e92e5fd489c38a64aaf4ca20aa6011bece1ef25ebc0144ab8017"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.5/sipnab-0.4.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "047c4deac250e5e8c3947408dae3427f01472d01aae9e434c17d472014d985d4"
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
