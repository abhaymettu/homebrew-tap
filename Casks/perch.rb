cask "perch" do
  version "1.3"
  sha256 "da327ef4c58315b1f7c1b72c1c361cade84d3880ec80f5239bf5f722b17877a3"

  url "https://github.com/abhaymettu/perch/releases/download/v#{version}/Perch-#{version}.zip"
  name "Perch"
  desc "Menu bar panel for Claude Code sessions, dev servers, launch agents and usage limits"
  homepage "https://github.com/abhaymettu/perch"

  depends_on macos: ">= :sonoma"

  app "Perch.app"

  # Perch is ad-hoc signed, not notarized, so Gatekeeper would refuse to open it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Perch.app"]
  end

  uninstall quit: "com.abhaymettu.perch"

  zap trash: "~/Library/Preferences/com.abhaymettu.perch.plist"
end
