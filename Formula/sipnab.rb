class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.223"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.223/sipnab-0.5.223-aarch64-apple-darwin.tar.gz"
      sha256 "377f65631411fc85362d92396026687b2c9060f4a66a2d9ddc146f13f5dbc827"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.223/sipnab-0.5.223-x86_64-apple-darwin.tar.gz"
      sha256 "1572b174698191184ffc9379189edcc915fd2978a7e8602726a9275486be2805"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.223/sipnab-0.5.223-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "62ba886fd9cc058bd06e2c1047a6bbe2e65f7dc938dc5b0481e9a6bddedefd19"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.223/sipnab-0.5.223-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "921a0bf37394709bebd1e8174a875f04be72a17aeaf8c6d8e48b6db5d7279a03"
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
