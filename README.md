# homebrew-council

Homebrew tap for [Council](https://github.com/albertofettucini/Council) — ask several LLMs one
question; they answer in parallel, peer-review each other blind, and you see how much they disagree.

```sh
brew install --cask albertofettucini/council/council
```

That downloads, unzips, and installs Council.app in one step. The app is unsigned (no paid Apple
cert), so the first launch needs a right-click → Open (macOS remembers it after that). To skip even
that:

```sh
brew install --cask --no-quarantine albertofettucini/council/council
```

After install, Council keeps itself up to date via Sparkle.
