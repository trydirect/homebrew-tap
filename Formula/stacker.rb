class Stacker < Formula
  desc "Deploy pre-built self-hosted stacks to your own server or to a cloud"
  homepage "https://try.direct"
  # No `version` line: brew audit --strict rejects it as redundant,
  # because Homebrew scans the version out of the release URL.
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/trydirect/stacker/releases/download/v0.3.5/stacker-v0.3.5-aarch64-darwin.tar.gz"
      sha256 "defdde63d98656c03e2b4d212604a87ca2cd292b35e5a8c9d34f97190834035d"
    end
    on_intel do
      url "https://github.com/trydirect/stacker/releases/download/v0.3.5/stacker-v0.3.5-x86_64-darwin.tar.gz"
      sha256 "cca9e82396b43302e98bdfe6ac25afbaabd116eccec03c0bb013527d37a6bbdb"
    end
  end

  # Linux is deliberately absent until the next release.
  #
  # The v0.3.5 Linux asset was built on ubuntu-latest, which had moved to
  # Ubuntu 26.04, so it requires GLIBC_2.39 and refuses to start on Ubuntu
  # 22.04 (glibc 2.35) or Debian 12 (2.36) - most of the machines that would
  # install it. Shipping it through brew would hand people a binary that
  # cannot run. trydirect/stacker now pins its release runners to
  # ubuntu-22.04 and ubuntu-22.04-arm; add both Linux blocks once a release
  # built on those has published its assets, taking each sha256 from the
  # published tarball rather than guessing it.
  #
  # on_linux do
  #   on_intel do
  #     url ".../stacker-vX.Y.Z-x86_64-linux.tar.gz"
  #     sha256 "..."
  #   end
  #   on_arm do
  #     url ".../stacker-vX.Y.Z-aarch64-linux.tar.gz"
  #     sha256 "..."
  #   end
  # end

  def install
    bin.install "stacker"
  end

  test do
    assert_match(/\d+\.\d+\.\d+/, shell_output("#{bin}/stacker --version"))
  end
end
