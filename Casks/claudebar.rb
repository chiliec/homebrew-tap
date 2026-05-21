cask "claudebar" do
  version "0.0.14"
  sha256 :no_check

  url "https://github.com/chiliec/ClaudeBar/releases/download/v#{version}/ClaudeBar.zip"
  name "ClaudeBar"
  desc "Menu bar app showing Claude.ai subscription usage"
  homepage "https://github.com/chiliec/ClaudeBar"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "ClaudeBar.app"

  zap trash: [
    "~/Library/Application Support/ClaudeBar",
    "~/Library/Preferences/com.claudebar.app.plist",
    "~/Library/Caches/com.claudebar.app",
  ]
end
