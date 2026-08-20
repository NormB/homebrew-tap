class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.116"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.116/sipnab-0.5.116-aarch64-apple-darwin.tar.gz"
      sha256 "3aff883c628f9e4205a5e8ce114da485f6059658f98f431b781802279367322d"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.116/sipnab-0.5.116-x86_64-apple-darwin.tar.gz"
      sha256 "aea6ea76045bd1f5f72ca95e70d6316b594a25d3d348a5b0f430a15505861c09"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.116/sipnab-0.5.116-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b2c6195d628599ad947401346bf826c987271ee3f3b7253e52ed06223e9774dd"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.116/sipnab-0.5.116-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bda7a1463b6a85f5ad40cd74aa6be51b7dc7a8d9321d22fedc288b0da4512aa7"
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
