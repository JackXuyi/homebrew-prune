cask "prune" do
  arch arm: "aarch64", intel: "x64"

  version "0.18.0"
  sha256 arm: "9eb83cdffe486f9b71691b3a950690c1c29cc07d37048eae1c4eb1100d1bf9a8", intel: "506c340c548f140c13bc96d76816bfae88c2a856cc4b9b7fe203dcaed600c940"

  url "https://github.com/JackXuyi/prune/releases/download/v#{version}/Prune_#{version}_#{arch}.dmg",
      verified: "github.com/JackXuyi/prune/"
  name "Prune"
  desc "Local dev-machine health toolbox: disk, memory, ports, network"
  homepage "https://github.com/JackXuyi/prune"

  livecheck do
    url :url
    strategy :github_latest
  end

  # 应用内置自动更新（latest.json + minisign 签名校验）。brew 元数据不追踪
  # 应用内升级；如需经 brew 管理版本：brew upgrade --cask prune
  auto_updates true
  depends_on macos: ">= :ventura"

  app "Prune.app"

  # CLI 随 .app 分发（Contents/Resources/bin/prune，与 GUI 同一次构建，版本零错位），
  # binary stanza 链接到 $(brew --prefix)/bin/prune；卸载 cask 一并移除。
  binary "#{appdir}/Prune.app/Contents/Resources/bin/prune"

  zap trash: [
    "~/Library/Application Support/com.xuyi.prune",
    "~/Library/Caches/com.xuyi.prune",
    "~/Library/Logs/com.xuyi.prune",
    "~/Library/Preferences/com.xuyi.prune.plist",
  ]
end
