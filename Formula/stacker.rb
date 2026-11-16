class Stacker < Formula
  desc "Deploy pre-built self-hosted stacks to your own server or to a cloud"
  homepage "https://try.direct"
  # No `version` line: brew audit --strict rejects it as redundant,
  # because Homebrew scans the version out of the release URL.
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/trydirect/stacker/releases/download/v0.3.9/stacker-v0.3.9-aarch64-darwin.tar.gz"
      sha256 "a9e1a935088c5b49f3b35c5a83aefa9e4380fb8ac8d92160862e70663db77f8c"
    end
    on_intel do
      url "https://github.com/trydirect/stacker/releases/download/v0.3.9/stacker-v0.3.9-x86_64-darwin.tar.gz"
      sha256 "24f90cbed97fa2ec77d83aebf653f3e8c89eb3056eaadad31951e3fffd926b20"
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
      url "https://github.com/trydirect/stacker/releases/download/v0.3.9/stacker-v0.3.9-aarch64-linux.tar.gz"
      sha256 "7330df04e442a560da8f8a484900a2f55c3d849ff8a8971cac776d0198e1bd6a"
    end
    on_intel do
      url "https://github.com/trydirect/stacker/releases/download/v0.3.9/stacker-v0.3.9-x86_64-linux.tar.gz"
      sha256 "46fce8a2ea0f52cf74a74608698ecbae2c41c4d4c9458dfd2a789d446cac4373"
    end
  end

  def install
    bin.install "stacker"
  end

  test do
    assert_match(/\d+\.\d+\.\d+/, shell_output("#{bin}/stacker --version"))
  end
end
