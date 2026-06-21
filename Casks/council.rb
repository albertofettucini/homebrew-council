cask "council" do
  version "1.1.3"
  sha256 "f8c33fd6be6d7a4fd17059d55e6dc66a276181d7b17b5de0e0d85bf653418213"

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
