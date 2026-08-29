class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.132"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.132/sipnab-0.5.132-aarch64-apple-darwin.tar.gz"
      sha256 "2ba0e3fb55af00c602d6bffabb7b25e3ca0bc81eacbe3f968f8ef53eb059b0dd"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.132/sipnab-0.5.132-x86_64-apple-darwin.tar.gz"
      sha256 "2e186e5ad6ac83f3c5bbcef766ce0c111b319a461e90edfdce4652477b3ce4a2"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.132/sipnab-0.5.132-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5aca0f3e9cf789006c2aee1a354f63deb6ffac29b00bd903ae1be8dff831527a"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.132/sipnab-0.5.132-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2c5ff1ed7bf5304efe975a98f1642b1f4d92eab78e1a627991e79b05ebffdde3"
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
