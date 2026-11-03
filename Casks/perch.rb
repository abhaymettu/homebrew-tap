cask "perch" do
  version "2.0"
  sha256 "00187fa181e76f949b08cf05f4b2a2dc9252e7688f57bc4ef6fd4d0a692ccbd5"

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
