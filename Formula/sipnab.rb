class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.99"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.99/sipnab-0.5.99-aarch64-apple-darwin.tar.gz"
      sha256 "2a1251829be5d92e3eec45cd491f93d5230ef754f872dcc87f05985f2193e3ff"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.99/sipnab-0.5.99-x86_64-apple-darwin.tar.gz"
      sha256 "58a6c3215bd5cd25fee3c12cc2f504829556dfd6c0b11f50c3a2210c6e8cbd8c"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.99/sipnab-0.5.99-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1eadc45ebc5aac3aff49302f54966fc526726c904076f934dfb7bb3f164cba89"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.99/sipnab-0.5.99-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fd8ec92caba279292bbfc936f198edc80cba7abc00fb13772e110a50d6a03fd6"
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
