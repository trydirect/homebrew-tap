class Stacker < Formula
  desc "Deploy pre-built self-hosted stacks to your own server or to a cloud"
  homepage "https://try.direct"
  # No `version` line: brew audit --strict rejects it as redundant,
  # because Homebrew scans the version out of the release URL.
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/trydirect/stacker/releases/download/v0.3.6/stacker-v0.3.6-aarch64-darwin.tar.gz"
      sha256 "25c466afcb4fe4d17f1f0ef4a500bcad58b08700eb091dec74a2e58fecbdbef1"
    end
    on_intel do
      url "https://github.com/trydirect/stacker/releases/download/v0.3.6/stacker-v0.3.6-x86_64-darwin.tar.gz"
      sha256 "8e011128f7d5b300c4743ae03902c117e1b610fd0ffdffbad9ee2bb7a6e75ec2"
    end
  end

  # Linux is served from v0.3.6 onward. The v0.3.5 assets were built on an
  # ubuntu-latest image that had moved to Ubuntu 26.04 and required
  # GLIBC_2.39, which does not exist on Ubuntu 22.04 (2.35) or Debian 12
  # (2.36). trydirect/stacker pins its release runners to ubuntu-22.04 and
  # ubuntu-22.04-arm now; both binaries below need only GLIBC_2.34, read off
  # the published tarballs.
  on_linux do
    on_arm do
      url "https://github.com/trydirect/stacker/releases/download/v0.3.6/stacker-v0.3.6-aarch64-linux.tar.gz"
      sha256 "eb1b3eb93ffdb204963e366a242cf068a29cec1acc29e1b949a588a30c7bea04"
    end
    on_intel do
      url "https://github.com/trydirect/stacker/releases/download/v0.3.6/stacker-v0.3.6-x86_64-linux.tar.gz"
      sha256 "8f70eb6b4635dd02dcc6ccbc349f16a1f73370ef029307ff835e8ce7b82658d0"
    end
  end

  def install
    bin.install "stacker"
  end

  test do
    assert_match(/\d+\.\d+\.\d+/, shell_output("#{bin}/stacker --version"))
  end
end
