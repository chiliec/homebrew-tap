cask "claudebar" do
  version "0.0.14"
  sha256 "2688e58533ba53000aca4a009f7b44f83d04f97bf143d66ab864042443cd673c"

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
