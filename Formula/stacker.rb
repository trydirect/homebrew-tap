class Stacker < Formula
  desc "Deploy pre-built self-hosted stacks to your own server or to a cloud"
  homepage "https://try.direct"
  # No `version` line: brew audit --strict rejects it as redundant,
  # because Homebrew scans the version out of the release URL.
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/trydirect/stacker/releases/download/v0.3.7/stacker-v0.3.7-aarch64-darwin.tar.gz"
      sha256 "dd5cba4438f8fd8e95be4f4ff038220672622994dc2ff94cbfcf377d897f0533"
    end
    on_intel do
      url "https://github.com/trydirect/stacker/releases/download/v0.3.7/stacker-v0.3.7-x86_64-darwin.tar.gz"
      sha256 "e0c543f15353ef32f5f6eba333fbc2b261cc1d1b3cdfa1d6926c1b9c6815ac73"
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
      url "https://github.com/trydirect/stacker/releases/download/v0.3.7/stacker-v0.3.7-aarch64-linux.tar.gz"
      sha256 "4c7c27dcca77bf836471092b9b3163674c1d8d1b0c47f90748ef1fb56c7e8952"
    end
    on_intel do
      url "https://github.com/trydirect/stacker/releases/download/v0.3.7/stacker-v0.3.7-x86_64-linux.tar.gz"
      sha256 "738fd80503dd8d8c927b7ddc5947481db20b7130d8e3a50f2afb3eea8730dab2"
    end
  end

  def install
    bin.install "stacker"
  end

  test do
    assert_match(/\d+\.\d+\.\d+/, shell_output("#{bin}/stacker --version"))
  end
end
