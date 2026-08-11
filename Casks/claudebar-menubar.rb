cask "claudebar-menubar" do
  version "0.0.26"
  sha256 "880b1e75ea9825724834d0eb7502995397cb5e3768d89fe482ef18a17d59328d"

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

  # App is signed with Apple Development certificate (not Developer ID +
  # Notarization), so Gatekeeper would block first launch on a quarantined
  # download. Strip the quarantine flag set by brew's download.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/ClaudeBar.app"]
  end

  zap trash: [
    "~/Library/Application Support/ClaudeBar",
    "~/Library/Preferences/com.claudebar.app.plist",
    "~/Library/Caches/com.claudebar.app",
  ]
end
