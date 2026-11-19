class Stacker < Formula
  desc "Deploy pre-built self-hosted stacks to your own server or to a cloud"
  homepage "https://try.direct"
  # No `version` line: brew audit --strict rejects it as redundant,
  # because Homebrew scans the version out of the release URL.
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/trydirect/stacker/releases/download/v0.3.10/stacker-v0.3.10-aarch64-darwin.tar.gz"
      sha256 "9d79db4e01d4ba8708d86a780984804705bd5c1be1ff0d5ef630b28aec37edc1"
    end
    on_intel do
      url "https://github.com/trydirect/stacker/releases/download/v0.3.10/stacker-v0.3.10-x86_64-darwin.tar.gz"
      sha256 "c7129fcdfee3346cc399b66d122c7e15c993806953ed0e7d0f0fd04dab837a4e"
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
      url "https://github.com/trydirect/stacker/releases/download/v0.3.10/stacker-v0.3.10-aarch64-linux.tar.gz"
      sha256 "da164f885e5542e7d0292a18e139b9509da628180cb0189f870248e1d12d90c9"
    end
    on_intel do
      url "https://github.com/trydirect/stacker/releases/download/v0.3.10/stacker-v0.3.10-x86_64-linux.tar.gz"
      sha256 "26a3c5959f7ffe9836cc887391479f580a449cf6d36836ef24e6ffad5be12106"
    end
  end

  def install
    bin.install "stacker"
  end

  test do
    assert_match(/\d+\.\d+\.\d+/, shell_output("#{bin}/stacker --version"))
  end
end
