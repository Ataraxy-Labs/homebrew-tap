class Inspect < Formula
  desc "Entity-level code review for Git. Graph-based risk scoring identifies which functions need careful review."
  homepage "https://github.com/Ataraxy-Labs/inspect"
  url "https://github.com/Ataraxy-Labs/inspect/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "3ada87b2cbe1d020a035404d1c6396dadc7637938fcd62fcfde99b816ea3f1de"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/Ataraxy-Labs/inspect.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build
  depends_on "pkg-config" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/inspect-cli")
    system "cargo", "install", *std_cargo_args(path: "crates/inspect-mcp")
  end

  test do
    output = shell_output("#{bin}/inspect --help 2>&1")
    assert_match "inspect", output.downcase
  end
end
