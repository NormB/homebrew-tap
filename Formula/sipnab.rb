class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.217"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.217/sipnab-0.5.217-aarch64-apple-darwin.tar.gz"
      sha256 "cabe1d4327b45a3b4705eb13d3a6ee719d57462e37792eec6e0b7729b27da79f"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.217/sipnab-0.5.217-x86_64-apple-darwin.tar.gz"
      sha256 "349e077f491ae056396add8c0e9dd43fac76103ba314858673fb39a32698c8d3"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.217/sipnab-0.5.217-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1c5b59dfd8245a5ab55a8960a207e9068855b505b8bebbc6195d4e06c87cf446"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.217/sipnab-0.5.217-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aacef37a3ef6855954605ae0ef71cd46a8aa614e38c36bc9316f81dbded35742"
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
