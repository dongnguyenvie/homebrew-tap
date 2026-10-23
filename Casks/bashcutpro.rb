cask "bashcutpro" do
  version "0.12.0"
  sha256 "063fe62b93e610c935005747e95c1618c3e33ec2da499e40b9547a805e21ccb1"

  url "https://github.com/dongnguyenvie/BashCutPro/releases/download/v#{version}/bashcutpro-#{version}-macos-aarch64.dmg"
  name "BashCutPro"
  desc "Video editor with an AI agent, plugins and batch runs (preview)"
  homepage "https://github.com/dongnguyenvie/BashCutPro"

  # BashCutPro ships as pre-releases while it is a preview, and the default strategy skips them.
  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        next if release["draft"]

        match = release["tag_name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
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

  caveats <<~EOS
    BashCutPro is a preview, still in development.
    For everyday editing use BashCut, the stable app:
      brew install --cask dongnguyenvie/tap/bashcut
  EOS
end
