class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://www.sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.4.4"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.4/sipnab-0.4.4-aarch64-apple-darwin.tar.gz"
      sha256 "782bea7a92f2e9a1d40686a58486c3bb58f0b468427e261bd054701d0fd85a26"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.4/sipnab-0.4.4-x86_64-apple-darwin.tar.gz"
      sha256 "46fdec3fc3031a9c8d1fe56ebee01f76e42ea64c92435ca474731fde4f12655b"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.4/sipnab-0.4.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3e260fc6bae30328180cce7a9fe4baa46d91e1136932d54047cd72dd052f2eda"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.4.4/sipnab-0.4.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8b411d4c67b6d5fdb49bb5fa22e1e28b516079c36a841b01c019eae763bddd4e"
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
