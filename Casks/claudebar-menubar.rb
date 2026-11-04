cask "claudebar-menubar" do
  version "0.0.43"
  sha256 "e154bc2cebd6a4930240bd49a87fcceea80a1ba37727d1a093e7fcecf7200994"

  url "https://github.com/chiliec/ClaudeBar/releases/download/v#{version}/ClaudeBar.zip"
  name "ClaudeBar"
  desc "Menu bar app showing Claude.ai subscription usage"
  homepage "https://github.com/chiliec/ClaudeBar"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "ClaudeBar.app"

  zap trash: [
    "~/Library/Application Support/ClaudeBar",
    "~/Library/Caches/com.claudebar.app",
    "~/Library/Preferences/com.claudebar.app.plist",
  ]
end
