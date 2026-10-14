cask "council" do
  version "1.3.1"
  sha256 "73d71a54d494b5ac55b39dcd10bfc746565b397d614a37f23a631ceb607efd33"

  url "https://github.com/albertofettucini/Council/releases/download/v#{version}/Council-#{version}-macOS.zip"
  name "Council"
  desc "Multi-LLM deliberation with blind peer review and a divergence score"
  homepage "https://github.com/albertofettucini/Council"

  # Council updates itself via Sparkle, so let Homebrew leave version management to the app.
  auto_updates true
  depends_on macos: :sonoma # macOS 14+

  app "Council.app"

  # Council is sandboxed, so the app's own data (sessions, preferences, Sparkle's cache) all lives
  # inside its container. The bare ~/Library paths are the non-sandboxed `council` CLI's copy.
  zap trash: [
    "~/Library/Application Support/Council",
    "~/Library/Caches/com.joseph.Council",
    "~/Library/Caches/org.sparkle-project.Sparkle/com.joseph.Council",
    "~/Library/Containers/com.joseph.Council",
    "~/Library/Preferences/com.joseph.Council.plist",
  ]

  # The app is unsigned (no paid Apple cert). Homebrew quarantines downloads, so on first launch
  # macOS blocks it ("could not verify") — Done, then System Settings → Privacy & Security → Open Anyway
  # (the button only shows for about an hour after the blocked launch). macOS 14 still accepts
  # right-click → Open; 15 and later do not. Homebrew no longer has --no-quarantine, so the way to
  # skip the prompt entirely is to clear the flag after installing:
  #   xattr -dr com.apple.quarantine /Applications/Council.app
  caveats <<~EOS
    Council is unsigned. On first launch macOS will say it could not verify the app: click Done,
    then open System Settings > Privacy & Security, scroll to Security, click "Open Anyway" (within
    the hour - the button goes away after that) and confirm with your password. macOS remembers it.
    On macOS 14, right-click > Open still works. To skip this step, run once after installing:
      xattr -dr com.apple.quarantine /Applications/Council.app
  EOS
end
