class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.4.16"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.16/sipnab-0.4.16-aarch64-apple-darwin.tar.gz"
      sha256 "a473f0bf066a191665eb96d95b8025188bd33ec906a0d549fe95b411a49b280b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.16/sipnab-0.4.16-x86_64-apple-darwin.tar.gz"
      sha256 "c32eefee506d19a65f517be250d57ad1f848cd591ce93aab11e35e1159c6c434"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.16/sipnab-0.4.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5ba200edc238104a17ce8f643e774d8957904d7e8214985644889ed2b6e24bcd"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.16/sipnab-0.4.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "99f215cd28e9df432dd903871b256b9fbceaee81b6f414cc072042c7b733e07d"
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
