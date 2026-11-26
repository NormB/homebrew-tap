class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.276"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.276/sipnab-0.5.276-aarch64-apple-darwin.tar.gz"
      sha256 "54ce3f654ce3caca0bc561e868548b419cb56a35b85b74eb49810183a4d10d3c"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.276/sipnab-0.5.276-x86_64-apple-darwin.tar.gz"
      sha256 "6ce890c25c69f7bfd20ed42553c82012614a5c08420503c615cf16cb3d47621d"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.276/sipnab-0.5.276-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "36c49427a4ab1aae7840caed847b2a9bbb573b4a05f064b7aa3c7a209015981d"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.276/sipnab-0.5.276-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "34c565d70b05f1844e1b83f9de5e9b574f5ad687eb651792898c6006cfdb25ee"
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
