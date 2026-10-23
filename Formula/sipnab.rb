class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.228"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.228/sipnab-0.5.228-aarch64-apple-darwin.tar.gz"
      sha256 "edafe4f3f5ff7c90633305a29a022eeda9688748beefe273a86ac90b22c42737"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.228/sipnab-0.5.228-x86_64-apple-darwin.tar.gz"
      sha256 "1324e88d8371b1ad8522921c9438af11b2b13220e7cbd77f2067e0f670ad4aae"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.228/sipnab-0.5.228-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a57039fff7fe4c5d61abbc45295c3dc3bd0811961e68aedbd5105b63cc0b9eb5"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.228/sipnab-0.5.228-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bb87184ce509b30cc6425d194c3e7694a08d863aa5fad5d3281581a95a1e3045"
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
