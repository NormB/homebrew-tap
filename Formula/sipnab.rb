class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.117"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.117/sipnab-0.5.117-aarch64-apple-darwin.tar.gz"
      sha256 "809d240e22250dc6ba9f8e6a1ce115317b62773a070511b2d6012f1fb758e21a"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.117/sipnab-0.5.117-x86_64-apple-darwin.tar.gz"
      sha256 "849e648eb54ae3d7ddf253fa197e908b296e9c72b20870b8022a9c0608f081dc"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.117/sipnab-0.5.117-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "84884e429a7fa988d615e54be8198024a4bf56b8a6082d56f086fa55c112ece0"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.117/sipnab-0.5.117-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2e5c519687e97916f9472fbaea57628f75ac373ddf40d90d894324f7abeb0f4c"
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
