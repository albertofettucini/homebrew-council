cask "council" do
  version "1.3.0"
  sha256 "cb5b8d11dfdcb78e43480bab2d813e662f6e13bb78d6dc10955738d02d0f3406"

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
  # right-click → Open; 15 and later do not. To skip the prompt entirely, install with:
  #   brew install --cask --no-quarantine council
  caveats <<~EOS
    Council is unsigned. On first launch macOS will say it could not verify the app: click Done,
    then open System Settings > Privacy & Security, scroll to Security, click "Open Anyway" (within
    the hour - the button goes away after that) and confirm with your password. macOS remembers it.
    On macOS 14, right-click > Open still works. Or install with --no-quarantine to skip this step.
  EOS
end
