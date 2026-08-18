class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.110"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.110/sipnab-0.5.110-aarch64-apple-darwin.tar.gz"
      sha256 "f687b9da75ae92ef9ebee439afc86d1e0889b350aca5dccc4e79570013c33f40"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.110/sipnab-0.5.110-x86_64-apple-darwin.tar.gz"
      sha256 "4026c9d711632019b922103182845fb673097b203692e0b639404dff08b1b846"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.110/sipnab-0.5.110-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "43b43706983db11d56067106492601798ec48994e62874775acd338dc5ea6a9d"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.110/sipnab-0.5.110-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b0fc79596bfcabd1a5fc639c44b3b457b83a5596e6ff03efd2079ea46f9175bf"
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
