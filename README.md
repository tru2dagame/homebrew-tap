# Homebrew tap

Reviewed prebuilt releases maintained by tru2dagame.

```sh
brew tap tru2dagame/tap
brew install tru2dagame/tap/rexurrect
```

The installed command is `rexurrect`. On a new Mac, enable its native 15-minute autosave with `rexurrect autosave install`. This is not a `brew services` service.

Update after reviewing the new release:

```sh
brew update
brew upgrade tru2dagame/tap/rexurrect
```

To hold the installed version, use `brew pin rexurrect`; unpin before an intentional upgrade.

Existing manual-trial installations need the one-time migration documented in the [source repository](https://github.com/tru2dagame/rexurrect). Do not overwrite or delete existing snapshots/configuration.

The Formula uses cargo-dist's standard release archive and the verified published SHA-256. The current bootstrap Formula installs only the executable and optional zsh recorder. New Formula updates are reviewed, signed and pushed with each chosen release; no upstream auto-sync is enabled. Current packages support Apple Silicon macOS.
