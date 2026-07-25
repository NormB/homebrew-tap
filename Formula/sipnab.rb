class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.38"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.38/sipnab-0.5.38-aarch64-apple-darwin.tar.gz"
      sha256 "c6b7506840b0e826d71546c482a870e29860526a18d86cbebacd3f6a520f8dcd"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.38/sipnab-0.5.38-x86_64-apple-darwin.tar.gz"
      sha256 "185685f2b4b0a943106c2b63756edb50ad6203ddaf129f793e8c3bfaf41eff93"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.38/sipnab-0.5.38-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f0bac3313903583c40cf90d152e1025e6795de1f0845f1922f303561532c7914"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.38/sipnab-0.5.38-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "181c645658fddd022131e586171208d321f0fb26b7960246b6c8755cca52faf0"
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
