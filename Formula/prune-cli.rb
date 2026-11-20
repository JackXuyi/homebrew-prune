class PruneCli < Formula
  desc "Local dev-machine health CLI (disk, memory, ports, network)"
  homepage "https://github.com/JackXuyi/prune"
  url "https://github.com/JackXuyi/prune/releases/download/v#{version}/Prune_CLI_#{version}_universal_macos.tar.gz"
  version "0.16.0"
  sha256 "ac88865c9c7fa5e58c90a096e1cd61f1d98cb53417d534737f849f87e225ddf3"

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
