class Stackdog < Formula
  desc "Security platform for Docker containers and Linux servers"
  homepage "https://stackdog.app"
  # No `version` line: brew audit --strict rejects it as redundant,
  # because Homebrew scans the version out of the release URL.
  license "MIT"

  # Served from the release assets .github/workflows/release.yml attaches on
  # every tag: four per-platform tarballs, each holding one static `stackdog`
  # binary. The Linux ones link musl statically, so they run on any
  # distribution; the macOS ones are arm64 and x86_64 builds of the same tag.
  on_macos do
    on_arm do
      url "https://github.com/trydirect/stackdog/releases/download/v0.3.1/stackdog-macos-aarch64.tar.gz"
      sha256 "a0d22193f542c96580fc2c945f0bfad6f00b1f21828e542a15196563a6f47b49"
    end
    on_intel do
      url "https://github.com/trydirect/stackdog/releases/download/v0.3.1/stackdog-macos-x86_64.tar.gz"
      sha256 "520845d18a1838094493381b111a1a826a32db974b28d1c6a9b63a5e0cf8d468"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/trydirect/stackdog/releases/download/v0.3.1/stackdog-linux-aarch64.tar.gz"
      sha256 "630423266f2a1ce0b27c89d17d18dcddcea270549d05d4d8716c8fad10f9b029"
    end
    on_intel do
      url "https://github.com/trydirect/stackdog/releases/download/v0.3.1/stackdog-linux-x86_64.tar.gz"
      sha256 "c2d5a503ed3aea1251038e972ec6b2c81a20a62c8f6fe0bbecae78c7b74ca962"
    end
  end

  def install
    bin.install "stackdog"
  end

  test do
    assert_match(/\d+\.\d+\.\d+/, shell_output("#{bin}/stackdog --version"))
  end
end
