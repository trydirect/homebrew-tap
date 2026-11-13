class Stackdog < Formula
  desc "Security platform for Docker containers and Linux servers"
  homepage "https://stackdog.app"
  # Source build for now. The stacker formula is served from prebuilt
  # per-platform release assets; stackdog can switch to the same shape once
  # its release pipeline attaches binaries.
  # No `version` line: brew audit --strict rejects it as redundant,
  # because Homebrew scans the version out of the release URL.
  url "https://github.com/trydirect/stackdog/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "887fe8ec9fca4d4b5a1ff18fe93a4ed0f405fb392e8b675ddb970851e35f7586"
  license "MIT"
  head "https://github.com/trydirect/stackdog.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args, "--path", "."
  end

  test do
    assert_match(/\d+\.\d+\.\d+/, shell_output("#{bin}/stackdog --version"))
  end
end
