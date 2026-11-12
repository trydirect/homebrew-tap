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

macOS on Apple Silicon and Intel, Linux on x86_64 and arm64.

The Linux binaries need glibc 2.34 or newer, which covers Ubuntu 22.04,
Debian 12, RHEL 9 and everything later. Release builds are pinned to Ubuntu
22.04 images for exactly this reason: a binary inherits the glibc of the
machine that built it, and v0.3.5 was briefly built on Ubuntu 26.04, which
made it refuse to start on the distributions most of our users run.
