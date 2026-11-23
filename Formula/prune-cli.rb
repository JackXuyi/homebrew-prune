class PruneCli < Formula
  desc "Local dev-machine health CLI (disk, memory, ports, network)"
  homepage "https://github.com/JackXuyi/prune"
  url "https://github.com/JackXuyi/prune/releases/download/v#{version}/Prune_CLI_#{version}_universal_macos.tar.gz"
  version "0.18.0"
  sha256 "2946b78a1f3f91d4f7c564cef19b43a5a892531066790ae83971609e11225d7e"

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
