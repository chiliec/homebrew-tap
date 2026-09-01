cask "claudebar-menubar" do
  version "0.0.35"
  sha256 "3ea0edabea6c817fe0c00d25968093cef5f7dbc76051f9163349cbe4a9135516"

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
