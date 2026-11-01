cask "perch" do
  version "1.3"
  sha256 "8050afa5d1c6c329011e41965e0421e2ddcd255c8a52d951d0d6789c633fe87f"

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
