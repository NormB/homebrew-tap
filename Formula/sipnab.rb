class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.147"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.147/sipnab-0.5.147-aarch64-apple-darwin.tar.gz"
      sha256 "6afa29e0d6e3a45f7f91b7e5c07baa5cbd5b1eb09fe32cc2a602d33b35548584"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.147/sipnab-0.5.147-x86_64-apple-darwin.tar.gz"
      sha256 "2faed36e3f9646398ab29fc6a06750c896a506817d85addc69ae4e8fc2789ba3"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.147/sipnab-0.5.147-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "08c997e523e8b867d18b72a7d7ef1e946d4a9947aa99997c38625d3fcf482ece"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.147/sipnab-0.5.147-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c9da7b28b5f02615eb25e2d39cc23d0dc664e0843beb169a88c2996f40df9261"
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
