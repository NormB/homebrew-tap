class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.188"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.188/sipnab-0.5.188-aarch64-apple-darwin.tar.gz"
      sha256 "f12a12a8e5759077c6fbbf09b51b7e3cda380d46d9816eee4f7f89ccedaa74c7"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.188/sipnab-0.5.188-x86_64-apple-darwin.tar.gz"
      sha256 "65133449a5fb3a08b47931df5b32a0ed14b5ebe69600d13a75286e30da253649"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.188/sipnab-0.5.188-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b78cd65be4d3d6f543c0eea664f7c37533f965473e2b8d938e18d3b140585896"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.188/sipnab-0.5.188-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ac8c388a1ab141261eeedec204ab386c5e3dfed79bb36b6c5b6777727d345d5b"
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
