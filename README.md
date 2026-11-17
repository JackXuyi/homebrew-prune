# homebrew-prune

Homebrew tap for [Prune](https://github.com/JackXuyi/prune) — a menu-bar app that finds disk space you can actually reclaim on a developer's Mac.

## Install

```sh
brew install --cask jackxuyi/prune/prune      # menu-bar app + CLI, one command
brew install jackxuyi/prune/prune-cli         # CLI only
```

The **cask** ships the CLI inside the app bundle and links it to `$(brew --prefix)/bin/prune`, so `prune scan` / `prune doctor` work after install.

## Notes

- `Casks/prune.rb` and `Formula/prune-cli.rb` are rendered and pushed automatically by the release workflow (`homebrew-tap` job in `JackXuyi/prune`) on every published tag. Do not edit them by hand.
- Both point at the universal (`aarch64` + `x64`) macOS builds on GitHub Releases.
