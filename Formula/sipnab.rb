class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.136"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.136/sipnab-0.5.136-aarch64-apple-darwin.tar.gz"
      sha256 "0aebb86aef0dd3046fd4d78932f99c1698e2f6c22cec1b73f441b9dc07f60520"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.136/sipnab-0.5.136-x86_64-apple-darwin.tar.gz"
      sha256 "6e884b7da7a2d987c20066a99bbce556d8eefbe0e4de3e63fdf6b734a94470e0"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.136/sipnab-0.5.136-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f1ce787548a1f6f86660eee511fcfd993ec00e51246c0801a3c4c4c785e925f6"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.136/sipnab-0.5.136-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "68687d11afe0c4677a14cbf67a7f0c60d172b932973f55342ab8371a14291b07"
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
