class Stacker < Formula
  desc "Deploy pre-built self-hosted stacks to your own server or to a cloud"
  homepage "https://try.direct"
  # No `version` line: brew audit --strict rejects it as redundant,
  # because Homebrew scans the version out of the release URL.
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/trydirect/stacker/releases/download/v0.3.8/stacker-v0.3.8-aarch64-darwin.tar.gz"
      sha256 "41d9154dfab14c2d7a09d997f96a0bb00150827a469f1adb41a0b7cc7f9d5b27"
    end
    on_intel do
      url "https://github.com/trydirect/stacker/releases/download/v0.3.8/stacker-v0.3.8-x86_64-darwin.tar.gz"
      sha256 "0e6945ca5c81820e74fa89e541723c9f43eed49f61dfef7d1a192d45fd26b684"
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
      url "https://github.com/trydirect/stacker/releases/download/v0.3.8/stacker-v0.3.8-aarch64-linux.tar.gz"
      sha256 "9ea85868181353234ea377b37a27569da30c03403c8199de5c66c8da2328daaf"
    end
    on_intel do
      url "https://github.com/trydirect/stacker/releases/download/v0.3.8/stacker-v0.3.8-x86_64-linux.tar.gz"
      sha256 "645696e1dcbeb08d29e85898de2f7dae889660ac5b6b6fbaccfdee577e1314ec"
    end
  end

  def install
    bin.install "stacker"
  end

  test do
    assert_match(/\d+\.\d+\.\d+/, shell_output("#{bin}/stacker --version"))
  end
end
