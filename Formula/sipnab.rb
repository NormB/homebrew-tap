class Sipnab < Formula
  desc "SIP & RTP capture, analysis, and security tool"
  homepage "https://sipnab.com"
  license any_of: ["MIT", "Apache-2.0"]
  version "0.5.254"

  on_macos do
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.254/sipnab-0.5.254-aarch64-apple-darwin.tar.gz"
      sha256 "bf59f4335e3220690429242348d1dd3555f5d1df6d63162d5fd4eacf5c2e7297"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.254/sipnab-0.5.254-x86_64-apple-darwin.tar.gz"
      sha256 "c40bf6de3f8f18db48bc7161096ae3f707f76484cadfed1bd719e833c9f42154"
    end
  end

  on_linux do
    # The gnu binaries dynamically link libpcap (and need it at runtime).
    depends_on "libpcap"
    on_arm do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.254/sipnab-0.5.254-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2a3f79617cc71ededbe253123c45182c521cf906b1b81df61c408697aca9a218"
    end
    on_intel do
      url "https://github.com/NormB/sipnab/releases/download/v0.5.254/sipnab-0.5.254-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fa6757d86069b33d03a2ab39ebe8961f3f9db5b23e619290d181484b3e06aacc"
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
