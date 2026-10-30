cask "claudebar-menubar" do
  version "0.0.37"
  sha256 "a222fb2e1b0e75c204554dc53d35a5277cb70839aa0c5e6f2c5dbde1a7d13cca"

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
