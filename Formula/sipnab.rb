class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.42"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.42/sipnab-0.5.42-aarch64-apple-darwin.tar.gz"
      sha256 "7e3f391a4086226ab7a3960f74257c0e1b742d42f52fa581ee51759e54e9cdbc"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.42/sipnab-0.5.42-x86_64-apple-darwin.tar.gz"
      sha256 "98b5ab6b278e6e048c94933362caad51efb2d27aca4440ca096dde15f41cea3f"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.42/sipnab-0.5.42-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e5aa46730e51cc834a6eac178d3d70d0576593e260fe5028ee194e6d3557c139"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.42/sipnab-0.5.42-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "45bbc4e6a4b786a8a5f9e50b6cc627a1ceccf745d73fcb2c4133dc29aac44ad3"
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
