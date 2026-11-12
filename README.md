# TryDirect Homebrew tap

```bash
brew install trydirect/tap/stacker
```

Stacker deploys pre-built self-hosted stacks onto a server you already have,
over SSH, or into your own cloud account with your own API key.

- Source: https://github.com/trydirect/stacker
- 296 ready-to-run stacks: https://github.com/trydirect/awesome-selfhosted-stacker

Without Homebrew:

```bash
curl -fsSL https://raw.githubusercontent.com/trydirect/stacker/main/install.sh | bash
```

## Platform support

macOS on Apple Silicon and Intel.

Linux is not served by this tap yet. The current release's Linux binary was
built on an image whose glibc is newer than Ubuntu 22.04 and Debian 12 carry,
so installing it there would produce a binary that cannot start. The build is
pinned now; the Linux formulas land with the next release. Until then, use the
installer above, which works wherever the binary does.
