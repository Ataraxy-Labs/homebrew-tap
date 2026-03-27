class Inspect < Formula
  desc "Entity-level code review for Git. Graph-based risk scoring identifies which functions need careful review."
  homepage "https://github.com/Ataraxy-Labs/inspect"
  url "https://github.com/Ataraxy-Labs/inspect/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "737ab237ebd9be2e60b51e71375b6a3ccb41c62c517aced4333a93ad38931ff2"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/Ataraxy-Labs/inspect.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build
  depends_on "pkg-config" => :build

  def install
    cd "crates" do
      system "cargo", "install", *std_cargo_args(path: "inspect-cli")
      system "cargo", "install", *std_cargo_args(path: "inspect-mcp")
    end
  end

  test do
    output = shell_output("#{bin}/inspect --help 2>&1")
    assert_match "inspect", output.downcase
  end
end
