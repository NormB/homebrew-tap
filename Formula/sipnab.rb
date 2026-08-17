class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.105"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.105/sipnab-0.5.105-aarch64-apple-darwin.tar.gz"
      sha256 "7e2d7efe41ef046217539444345370327428693a5698c3535cad800609e54d35"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.105/sipnab-0.5.105-x86_64-apple-darwin.tar.gz"
      sha256 "e4b4a77339fb298072c7c739ea1a23e28cf042b65395161581ec183b5b642137"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.105/sipnab-0.5.105-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fd009c56da3da45ec69fcfd0b810cb388a76db35ee7c42cd77ecb1db2e936f52"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.105/sipnab-0.5.105-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "83af86d9ccd38eb70e16cc85e654c5508b0c04ee62cf6f4b47dd33d62012ad13"
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
