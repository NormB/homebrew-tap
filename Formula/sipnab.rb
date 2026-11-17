class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.263"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.263/sipnab-0.5.263-aarch64-apple-darwin.tar.gz"
      sha256 "d3b990ec6bb19ac8751c0c12629ebcae2ce45d359ae8ee247cf916983b06c49b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.263/sipnab-0.5.263-x86_64-apple-darwin.tar.gz"
      sha256 "37504f61cd578092774705f19aebdb63bcf845b076b4f811cd0df8a57cb80690"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.263/sipnab-0.5.263-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "023a01a900aa1fd5417b779df3509d77a353ee36a222e546bfa09c790fcc9deb"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.263/sipnab-0.5.263-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "66ba393297c856dc9a69ac44eb446727e4cd49d3a611e8258cd2e46cbb707ec1"
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
