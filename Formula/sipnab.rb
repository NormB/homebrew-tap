class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.130"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.130/sipnab-0.5.130-aarch64-apple-darwin.tar.gz"
      sha256 "769f4475789041879ac11d859344fd97b11d857c151a2fa15c900b9f93116450"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.130/sipnab-0.5.130-x86_64-apple-darwin.tar.gz"
      sha256 "74db10309e06ea6b95f0e8781285b6c9a3a9e77226e7f758ec596c892adcf601"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.130/sipnab-0.5.130-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5ff06e4e8837b93cf08b528c968418b908deddc93f065ebf79b4e4b9341ebb2a"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.130/sipnab-0.5.130-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e20b6392aa673c68e2bf477405d5c46e8aa1d39f473193b5f505833334ad25c7"
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
