class PruneCli < Formula
  desc "Local dev-machine health CLI (disk, memory, ports, network)"
  homepage "https://github.com/JackXuyi/prune"
  url "https://github.com/JackXuyi/prune/releases/download/v#{version}/Prune_CLI_#{version}_universal_macos.tar.gz"
  version "0.17.0"
  sha256 "017030f49e7fb423e1e2e2f46e1165a53d39887a74da12483baa638a19d533d1"

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
