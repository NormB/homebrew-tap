class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.35"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.35/sipnab-0.5.35-aarch64-apple-darwin.tar.gz"
      sha256 "51ed06f35287f552dd7486839bcd992683b18db58ff3b6c8514d25b871215340"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.35/sipnab-0.5.35-x86_64-apple-darwin.tar.gz"
      sha256 "1f9cb95450fd80eeb87e48a8c765c1948134a29dc7e9d552e047a01e76d95b0b"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.35/sipnab-0.5.35-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7a4723c14373a492c4b89abaaf2cc90e0966efdbdddcc18cd782ca8f150f9599"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.35/sipnab-0.5.35-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aa13c8df281713a76aeb75a4c4d563a07a8f330607f432d613ceb7379280dcaa"
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
