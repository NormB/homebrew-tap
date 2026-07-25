class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.39"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.39/sipnab-0.5.39-aarch64-apple-darwin.tar.gz"
      sha256 "01a86bf8870bdabdfe3ccc9670749ac0190fbe422aafe5083c88fd8e1bd09bad"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.39/sipnab-0.5.39-x86_64-apple-darwin.tar.gz"
      sha256 "97ebe1b133bf5b685d6fb73be862e4155cb8cf767b9fcf352327744702748a58"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.39/sipnab-0.5.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5c2f46667668182477a30e420dc58b1d2464bc04d150f492496b47209db4d147"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.39/sipnab-0.5.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eccc22527df4bef8142e9f9f0d59890a59df063903dbc9a419dfabd6951b4aa0"
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
