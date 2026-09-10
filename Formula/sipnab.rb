class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.163"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.163/sipnab-0.5.163-aarch64-apple-darwin.tar.gz"
      sha256 "aac78cadd4a5f6e1899f74b0b59de8f3822c4f2e1c0118f8ac227fcd6dea0bd8"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.163/sipnab-0.5.163-x86_64-apple-darwin.tar.gz"
      sha256 "561f43571edccfac51183cb7b8daa53922b4fc014b2c3ba0bfad468b395061dc"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.163/sipnab-0.5.163-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "486c272bdbf208930806fb1a252e451cf7df5067be737b4829cea844aedd163c"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.163/sipnab-0.5.163-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c1e020d662299dc186ca3d5ba71f4b9a462a737a164e960312b4284a942c5f00"
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
