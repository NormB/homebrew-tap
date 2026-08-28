class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.129"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.129/sipnab-0.5.129-aarch64-apple-darwin.tar.gz"
      sha256 "deea81f67cea4fbf85181ff8d7b8b3249b80210938fd9f434e4efc9a0a86eb67"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.129/sipnab-0.5.129-x86_64-apple-darwin.tar.gz"
      sha256 "4815a42d3eadaf48474d16be5fdda9d630580f680d371bb401781f26b25bdd5e"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.129/sipnab-0.5.129-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dfd5738f2be8d0c9251e09eb8b04bfb5e67734bb6751092aaf7a1ea6b54a6e5a"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.129/sipnab-0.5.129-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "722a013931e4669cd084c126b4cbcf6133285fb26deedf04caa5fb5f54dcdf8e"
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
