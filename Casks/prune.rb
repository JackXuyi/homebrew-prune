cask "prune" do
  arch arm: "aarch64", intel: "x64"

  version "0.16.0"
  sha256 arm: "a14863154734caf6f1cd0c1c0f583df67b08a0791b9773a5259ff61e7d635a7c", intel: "21aabf26d228f697447c6354daea6d0372a074cace3ddfddf7a8a44e6be9c64f"

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
