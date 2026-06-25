cask "claudebar-menubar" do
  version "0.0.18"
  sha256 "248c222448f4fb244ab7765801dc88f39ef43c45bc37b89b78c5df794a23d0fb"

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
