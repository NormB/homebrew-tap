class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.7"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.7/sipnab-0.5.7-aarch64-apple-darwin.tar.gz"
      sha256 "1d6df671e118b43ba5e705f57ffb8d39c0bf6d0c1cb197ca08a8dc2b851e0f3a"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.7/sipnab-0.5.7-x86_64-apple-darwin.tar.gz"
      sha256 "a43e639a64d4f7914150fb9a739c9697bd27057845cb818bbe8790943df07219"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.7/sipnab-0.5.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3c2b71964698920b2babe48b26100392d55c82cc36d46bbf77c1792aaa50e578"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.7/sipnab-0.5.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ab27d6578c2b21a1fd44549b99f3bacab53b83473bdae42e6a20714ed817a35c"
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
