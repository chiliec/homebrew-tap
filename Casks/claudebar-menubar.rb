cask "claudebar-menubar" do
  version "0.0.39"
  sha256 "c24a492bf8dc0e89e4a741cad98a82b7b76e5e404eb7d8bc1b2a5b4645a9e40f"

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
