class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.127"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.127/sipnab-0.5.127-aarch64-apple-darwin.tar.gz"
      sha256 "fdd6cec613df369b4a37d91d41d5094ef9de899400e2c65ecf94574253660b78"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.127/sipnab-0.5.127-x86_64-apple-darwin.tar.gz"
      sha256 "6003c4eaf175f11c31df22abc171848771a2db17f8413c0cd5c659e2c00955ea"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.127/sipnab-0.5.127-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "db5671ed4c7405117f4b878f9e0650e2203d5f1190cd12732e4a46d30a937471"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.127/sipnab-0.5.127-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a1d8ed26b87a9c939a1d87b6139eb80b35c40015073126e4862b3874902a6344"
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
