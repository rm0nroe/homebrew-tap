# Homebrew tap

Install Herdr Electrified on an Apple Silicon Mac:

```sh
brew install rm0nroe/tap/herdr-electrified
export PATH="$(brew --prefix)/bin:$HOME/.local/bin:$PATH"
herdr-electrified install
```

After a formula update, run `herdr-electrified upgrade` to reapply your saved settings.
To restore your settings before uninstalling, run `herdr-electrified undo`.
