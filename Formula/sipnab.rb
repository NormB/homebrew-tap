class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.4.9"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.9/sipnab-0.4.9-aarch64-apple-darwin.tar.gz"
      sha256 "346f97d46de02b2cb2a23357aa7c667ec446786aca3528fb9991fdcf9e8fa6b7"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.9/sipnab-0.4.9-x86_64-apple-darwin.tar.gz"
      sha256 "1e86e31081f6749ed3121c22c58185fbeda60d8220fb0098cecc14395bbf7580"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.9/sipnab-0.4.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eb49216307687ad90528367812b0e097631b241f25eaac8bcb9c9b13fc51a65b"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.9/sipnab-0.4.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d7feef897bb4f68304640be441e46ff0edff92b0cc8b67f6c0195d18732d2375"
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
