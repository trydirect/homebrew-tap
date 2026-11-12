class Stackdog < Formula
  desc "Security platform for Docker containers and Linux servers"
  homepage "https://stackdog.app"
  # Source build for now. The stacker formula is served from prebuilt
  # per-platform release assets; stackdog can switch to the same shape once
  # its release pipeline attaches binaries.
  # No `version` line: brew audit --strict rejects it as redundant,
  # because Homebrew scans the version out of the release URL.
  url "https://github.com/trydirect/stackdog/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "68f8a24223129cc9e6060a6080f7406cbf416c2319a5cb68ab7972c9780fd6b3"
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
