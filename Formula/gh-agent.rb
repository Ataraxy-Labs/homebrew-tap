class GhAgent < Formula
  desc "Agent-friendly GitHub CLI for PR reviews"
  homepage "https://github.com/Ataraxy-Labs/gh-agent"
  url "https://github.com/Ataraxy-Labs/gh-agent/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2b699aac6c3c60c6478accc277f764322b74c2d7d42250e43281eb0052b66969"
  license "MIT"

  depends_on "rust" => :build
  depends_on "pkg-config" => :build
  depends_on "libgit2"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # gh-agent requires GITHUB_TOKEN to operate; verify it starts
    assert_match "Agent-friendly GitHub CLI", shell_output("#{bin}/gh-agent --help")
  end
end
