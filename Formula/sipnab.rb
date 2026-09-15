class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.175"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.175/sipnab-0.5.175-aarch64-apple-darwin.tar.gz"
      sha256 "d15927de213af76d37b54a6caddb1394c6968225f1676588d794ac5a64c34b70"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.175/sipnab-0.5.175-x86_64-apple-darwin.tar.gz"
      sha256 "3801ce9f477291f884abc8cfeed1eeecd5e26d109c3c26b33edb3b46ee5c9ac7"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.175/sipnab-0.5.175-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d091be6e063f919f59b9f260f53c6f76e850d0c24603ebf24e401f9637202b2d"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.175/sipnab-0.5.175-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "21b650f5e0341896b7593c793988c4634ec8fdebf08ce599ea39c60c8a879599"
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
