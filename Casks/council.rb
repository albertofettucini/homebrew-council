cask "council" do
  version "1.1.5"
  sha256 "b0b680cc864b1f12a8bee1d8f0440f9c4870af0dd907324bde702b4da248b6c1"

  url "https://github.com/albertofettucini/Council/releases/download/v#{version}/Council-#{version}-macOS.zip"
  name "Council"
  desc "Multi-LLM deliberation with blind peer review and a divergence score"
  homepage "https://github.com/albertofettucini/Council"

  # Council updates itself via Sparkle, so let Homebrew leave version management to the app.
  auto_updates true
  depends_on macos: :sonoma # macOS 14+

  app "Council.app"

  zap trash: [
    "~/Library/Application Support/Council",
    "~/Library/Caches/com.joseph.Council",
    "~/Library/Caches/org.sparkle-project.Sparkle/com.joseph.Council",
    "~/Library/Preferences/com.joseph.Council.plist",
  ]

  # The app is unsigned (no paid Apple cert). Homebrew quarantines downloads, so on first launch
  # macOS shows an "unidentified developer" prompt — right-click the app → Open (once). To skip the
  # prompt entirely, install with:  brew install --cask --no-quarantine council
  caveats <<~EOS
    Council is unsigned. On first launch, right-click Council in Applications and choose Open,
    then confirm — macOS remembers the choice. Or install with --no-quarantine to skip that step.
  EOS
end
