class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.265"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.265/sipnab-0.5.265-aarch64-apple-darwin.tar.gz"
      sha256 "02c52a574926e35a330157c0cd84127536e80d5769f4893ea38f05e31b71d03a"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.265/sipnab-0.5.265-x86_64-apple-darwin.tar.gz"
      sha256 "729f87c9d67e9b2885da5e940759fffd0a9fcafce5d84a286f0a96b761ee75e5"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.265/sipnab-0.5.265-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f0b0fd1ff47314e842c69c02156d600bcb62765edb2f8bb6461d5bb0d9911e90"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.265/sipnab-0.5.265-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "52d73037d19d09b5f3554665b142f71db90bfd6f152482638ee72e89a2f03065"
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
