# homebrew-council

Homebrew tap for [Council](https://github.com/albertofettucini/Council) — ask several LLMs one
question; they answer in parallel, peer-review each other blind, and you see how much they disagree.

```sh
brew install --cask albertofettucini/council/council
```

That downloads, unzips, and installs Council.app in one step. The app is unsigned (no paid Apple
cert), so macOS blocks the first launch: open Council once, click Done on the "could not verify"
message, then System Settings → Privacy & Security → scroll to Security → Open Anyway, and confirm
with your password. Do it within the hour — the button goes away after that. macOS remembers it from
then on. (On macOS 14, right-click → Open still works.) To skip even that:

```sh
brew install --cask --no-quarantine albertofettucini/council/council
```

After install, Council keeps itself up to date via Sparkle.
