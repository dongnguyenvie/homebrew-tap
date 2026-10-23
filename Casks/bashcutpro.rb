cask "bashcutpro" do
  version "0.10.0"
  sha256 "d1ad394b39337a27529143cf7f6ff6820a477f8fd23a1f624fcbdaf3e070d424"

  url "https://github.com/dongnguyenvie/BashCutPro/releases/download/v#{version}/bashcutpro-#{version}-macos-aarch64.dmg"
  name "BashCutPro"
  desc "Video editor with an AI agent, plugins and batch runs, based on FilmCraft"
  homepage "https://github.com/dongnguyenvie/BashCutPro"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "BashCutPro.app"
  binary "#{appdir}/BashCutPro.app/Contents/MacOS/bashcutpro-cli"
  binary "#{appdir}/BashCutPro.app/Contents/MacOS/bcpro"

  zap trash: [
    "~/Library/Application Support/BashCutPro",
    "~/Library/Caches/BashCutPro",
    "~/Library/Caches/com.birchapps.bashcutpro",
    "~/Library/HTTPStorages/com.birchapps.bashcutpro",
    "~/Library/Preferences/com.birchapps.bashcutpro.plist",
    "~/Library/Saved Application State/com.birchapps.bashcutpro.savedState",
  ]
end
