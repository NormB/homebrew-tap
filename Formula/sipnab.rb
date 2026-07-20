class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.19"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.19/sipnab-0.5.19-aarch64-apple-darwin.tar.gz"
      sha256 "f3509e540455e4632f29114af5bd3c9827c6626e6d7ab4d6bff2b483b6fa6dd3"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.19/sipnab-0.5.19-x86_64-apple-darwin.tar.gz"
      sha256 "b5611abcc78cc34a39b537f48be6791afa194a5ac4b6722458b6874cf170cfea"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.19/sipnab-0.5.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "976b51a92c006f67fa6d1beb9b7a57e626e7a22c7a0ab150b84d50b828344574"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.19/sipnab-0.5.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dc94d2a3adb8cb56c3d2a7fdea29842ab17bb9ed661ab9df45b3c8ffd1f71881"
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
