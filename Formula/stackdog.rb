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
    # std_cargo_args already carries --path . in current Homebrew;
    # adding it again makes cargo reject the command.
    # The source tarball has no .git, so build.rs cannot derive the hash
    # and --version would say (unknown). Pin it to the tag's commit; the
    # line moves with the url and sha256 on every version bump.
    ENV["STACKDOG_GIT_HASH"] = "235d4dd"
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match(/\d+\.\d+\.\d+/, shell_output("#{bin}/stackdog --version"))
  end
end
