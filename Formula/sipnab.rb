class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.137"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.137/sipnab-0.5.137-aarch64-apple-darwin.tar.gz"
      sha256 "de1a460b27179a7b87ad4a5d8eae0c5fc39354f550d24273209063fd5576c953"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.137/sipnab-0.5.137-x86_64-apple-darwin.tar.gz"
      sha256 "6ea7c91b5940cc6d3243936821a5b96ec32ba822f83bf23485afac8c49fb56b3"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.137/sipnab-0.5.137-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "658ec5752d29697337d3c94aeab7cc56a051065906381d6fb36be2573dcdd54c"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.137/sipnab-0.5.137-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2029a25de2919a9fff63a31de5f14126111f175f0498b1b78062275609d89c78"
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
