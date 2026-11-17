class PruneCli < Formula
  desc "Local dev-machine health CLI (disk, memory, ports, network)"
  homepage "https://github.com/JackXuyi/prune"
  url "https://github.com/JackXuyi/prune/releases/download/v#{version}/Prune_CLI_#{version}_universal_macos.tar.gz"
  version "0.14.0"
  sha256 "6e00ab6de13c7183d93033816759f3bac1644d7c08cc83275c167b99e1581d3b"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on macos: :ventura

  def install
    bin.install "prune"
  end

  def caveats
    <<~EOS
      CLI only. For the menu-bar app, run:
        brew install --cask jackxuyi/prune/prune
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/prune --version")
  end
end
