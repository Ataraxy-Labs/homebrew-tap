class GhAgent < Formula
  desc "Agent-friendly GitHub CLI for PR reviews"
  homepage "https://github.com/Ataraxy-Labs/gh-agent"
  url "https://github.com/Ataraxy-Labs/gh-agent/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1b9000a108c2bfd0bc27370e60696e9fd0e7d19486acdaf53f6f820b24c8ef31"
  license "MIT"

  depends_on "rust" => :build
  depends_on "ataraxy-labs/tap/sem"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # gh-agent requires GITHUB_TOKEN to operate; verify it starts
    assert_match "Agent-friendly GitHub CLI", shell_output("#{bin}/gh-agent --help")
  end
end
