class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.17"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.17/sipnab-0.5.17-aarch64-apple-darwin.tar.gz"
      sha256 "b7e5daaea7c5e538f32f70439125dab47a0ee0f3e470b98b8e79871725493d9b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.17/sipnab-0.5.17-x86_64-apple-darwin.tar.gz"
      sha256 "b6882cfa9b1a385a774b38a2ae38b9b89a486aecfa8a643f758f722d4ac6d344"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.17/sipnab-0.5.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dbfacbb02cda7b121e749c6cf7c2e17e17a60d3f28a055b54f5a992f900c9be6"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.17/sipnab-0.5.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "518bae09cc6bc20490f354f34035f675bdd1a65d21c144cf89fa664d91de6212"
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
