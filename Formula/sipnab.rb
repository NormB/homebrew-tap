class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.226"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.226/sipnab-0.5.226-aarch64-apple-darwin.tar.gz"
      sha256 "35a056eea66ee0ffc0a86a684ad0bad99884ceed28d4a0b72330048dca547816"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.226/sipnab-0.5.226-x86_64-apple-darwin.tar.gz"
      sha256 "683c0dbe48f1d384d2557e353b7de486264723bab8b4b506af3342fd13aff9a0"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.226/sipnab-0.5.226-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f2dd84f04b7523d6750ab4d9194e108285b20a881777cbc2b87e7a507f92dc5c"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.226/sipnab-0.5.226-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c053becd76fe5c1f9d834bb9d651605635240739b8a811204e15676e60e91ade"
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
