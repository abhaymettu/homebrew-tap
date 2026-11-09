cask "perch" do
  version "2.1"
  sha256 "f908eb88e41178bfe6ef5e7bc5e6f9d4f083009bd8c9a65e19a857712531216e"

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
