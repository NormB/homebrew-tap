class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.271"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.271/sipnab-0.5.271-aarch64-apple-darwin.tar.gz"
      sha256 "b92defb95e95df049ee79daac3988b0838ec72285a4dfd27a4ad67685d075896"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.271/sipnab-0.5.271-x86_64-apple-darwin.tar.gz"
      sha256 "560359a9b0f7c5f78bb951b9e1c109259742ab890e0f21ee7c54b9b226f37f32"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.271/sipnab-0.5.271-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4d38f16e305586433ee8a89d57a51fb76a403121f2547a4cbd069c3187820e3e"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.271/sipnab-0.5.271-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce74911b4a80126ff02aa32ead225f45f30bfa0d9cea5f6b22435b62b3f1c58a"
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
