class StatusPanel < Formula
  desc "Self-hosted status page with uptime monitoring and a probe agent"
  homepage "https://github.com/trydirect/status"
  # No `version` line: brew audit --strict rejects it as redundant,
  # because Homebrew scans the version out of the release URL.
  license "MIT OR Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/trydirect/status/releases/download/v0.2.2/status-panel-0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "53283710a9aa967889abea826d7b802d403bd4b41f552d563237d0f168996642"
    end
    on_intel do
      url "https://github.com/trydirect/status/releases/download/v0.2.2/status-panel-0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "b0ac84d2b88777a93af54fcbde75a21ed34aa32409f1d80811556dee3270b8c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/trydirect/status/releases/download/v0.2.2/status-panel-0.2.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3f715879af889d7706003a51eb5e4f65e30bc19863bc3d14aa2354793dbf0403"
    end
    on_intel do
      url "https://github.com/trydirect/status/releases/download/v0.2.2/status-panel-0.2.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "16abe864e66df041f02b3a34f7c093c413c2f2881183ed87a9740b2d4fdf6a0b"
    end
  end

  def install
    bin.install "status"
    pkgshare.install "templates", "static"
    pkgshare.install "LICENSE-MIT", "LICENSE-APACHE", "README.md"
  end

  def caveats
    <<~EOS
      The web UI loads templates/ and static/ from the current working directory.
      To serve the UI from another directory, copy them there first:
        cp -r #{pkgshare}/templates #{pkgshare}/static .
    EOS
  end

  test do
    assert_match(/\d+\.\d+\.\d+/, shell_output("#{bin}/status --version"))
  end
end
