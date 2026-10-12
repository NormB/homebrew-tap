class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.212"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.212/sipnab-0.5.212-aarch64-apple-darwin.tar.gz"
      sha256 "fa35ea28814294577b7a76d59b861473d631040e8c7176c135a823fccd82df12"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.212/sipnab-0.5.212-x86_64-apple-darwin.tar.gz"
      sha256 "2c5fcfe9215b94e34ee030546183de94c31833f9ef418ec5a45c42a176b77591"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.212/sipnab-0.5.212-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "83c0e36cf04d73c0b0b459986ee6cb0540a5f57b8aa100b25b5f27015c638306"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.212/sipnab-0.5.212-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4b4fdea074ff05d3aaa8fa9c4f816cb6e299a133c3f029799c72f5bf6144f34f"
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
