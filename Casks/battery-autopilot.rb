cask "battery-autopilot" do
  version "1.5.2"
  sha256 "5fc7066c98835baa17b11a3fad597847502d2e6a763c38e70d7daa7efce4aeef"

  url "https://macbattery.net/updates/BatteryAutopilot-#{version}.dmg"
  name "Battery Autopilot"
  desc "AI battery care with 80% charge limit and measured power savings"
  homepage "https://macbattery.net/"

  livecheck do
    url "https://macbattery.net/updates/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "Battery Autopilot.app"

  uninstall launchctl: "net.anysocial.batterypilot.helper",
            quit:      "net.anysocial.batterypilot"

  zap trash: [
    "~/Library/Application Support/BatteryPilot",
    "~/Library/Caches/net.anysocial.batterypilot",
    "~/Library/HTTPStorages/net.anysocial.batterypilot",
    "~/Library/Preferences/net.anysocial.batterypilot.plist",
  ]
end
