class GhAgent < Formula
  desc "Agent-friendly GitHub CLI for PR reviews"
  homepage "https://github.com/Ataraxy-Labs/gh-agent"
  url "https://github.com/Ataraxy-Labs/gh-agent/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d47d91c34cfe7e8568a9833f1996bfec32e00214ebf71ef98ac91fa5b8c965ed"
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
