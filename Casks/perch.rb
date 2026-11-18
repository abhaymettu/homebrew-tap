cask "perch" do
  version "2.2"
  sha256 "156b42300ed21b217d777da53a9220d3f640c455f1444a631f5ad55b9bf03de4"

  url "https://github.com/abhaymettu/perch/releases/download/v#{version}/Perch-#{version}.zip"
  name "Perch"
  desc "Menu bar owl showing Claude usage per account and when each week resets"
  homepage "https://github.com/abhaymettu/perch"

  depends_on macos: :sonoma

  app "Perch.app"

  # Perch is ad-hoc signed, not notarized, so Gatekeeper would refuse to open it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Perch.app"]
  end

  uninstall quit: "com.abhaymettu.perch"

  zap trash: "~/Library/Preferences/com.abhaymettu.perch.plist"
end
