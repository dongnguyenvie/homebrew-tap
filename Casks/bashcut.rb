cask "bashcut" do
  version "0.0.34"
  sha256 "567ef3688d67940d646efcdf536e64e29844197cdda72f8061fb3617cf4df50f"

  url "https://github.com/dongnguyenvie/BashCut/releases/download/v#{version}/BashCut-#{version}.zip"
  name "BashCut"
  desc "Video editor driven by coding agents through a CLI and MCP server"
  homepage "https://github.com/dongnguyenvie/BashCut"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "BashCut.app"
  binary "#{appdir}/BashCut.app/Contents/MacOS/bashcut"
  binary "#{appdir}/BashCut.app/Contents/MacOS/bashcut-mcp"

  zap trash: [
    "~/Library/Application Support/BashCut",
    "~/Library/Caches/app.bashcut",
    "~/Library/Caches/BashCut",
    "~/Library/Containers/app.bashcut",
    "~/Library/HTTPStorages/app.bashcut",
    "~/Library/Logs/BashCut",
    "~/Library/Preferences/app.bashcut.plist",
    "~/Library/Saved Application State/app.bashcut.savedState",
  ]
end
