class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.153"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.153/sipnab-0.5.153-aarch64-apple-darwin.tar.gz"
      sha256 "19c3a3d5acb09a22ffcf34625bb71453953978e489453cc8d50f5d88155495ea"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.153/sipnab-0.5.153-x86_64-apple-darwin.tar.gz"
      sha256 "ac59d6f67a051c709a47b4fcb1c77408ab41287f8ec22f865baa8f44a001192b"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.153/sipnab-0.5.153-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "947f2927ff5c7b79aedaeb4d5a3b891ab8c558b1cbe848600972c569e55295e4"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.153/sipnab-0.5.153-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e098138e99c7bcb5b7498a061e5fc033d725dff64fb4637c1bb395714a0ab040"
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
