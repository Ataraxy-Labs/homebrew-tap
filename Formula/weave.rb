class Weave < Formula
  desc "Entity-level semantic merge driver for Git — resolves conflicts by understanding code structure"
  homepage "https://github.com/Ataraxy-Labs/weave"
  url "https://github.com/Ataraxy-Labs/weave/archive/refs/tags/v0.2.6.tar.gz"
  sha256 "06f393f56b3899237cdb461ccb55e0eacedbf35d094de0afc485ac66aca15142"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/Ataraxy-Labs/weave.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build
  depends_on "pkg-config" => :build

  def install
    cd "crates" do
      system "cargo", "install", *std_cargo_args(path: "weave-cli")
      system "cargo", "install", *std_cargo_args(path: "weave-driver")
      system "cargo", "install", *std_cargo_args(path: "weave-mcp")
    end
  end

  test do
    # Test that weave can run the benchmark
    output = shell_output("#{bin}/weave bench 2>&1")
    assert_match "weave merge benchmark", output
    assert_match "clean merges", output

    # Test that weave-driver binary exists and runs
    output = shell_output("#{bin}/weave-driver --help 2>&1", 1)
    assert_match "weave-driver", output.downcase
  end
end
