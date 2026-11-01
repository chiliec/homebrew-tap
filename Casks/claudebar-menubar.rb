cask "claudebar-menubar" do
  version "0.0.38"
  sha256 "652aa73f1b113a592f22e6e60918231972da2f33b555640ed1dd37e45f4cfbb2"

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
