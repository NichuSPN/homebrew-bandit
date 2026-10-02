class BanditAi < Formula
  desc "Autonomous local terminal AI agent powered by Go and Rust"
  homepage "https://github.com/NichuSPN/bandit"
  version "1.0.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/NichuSPN/bandit/releases/download/v1.0.1/bandit-v1.0.1-darwin-arm64.tar.gz"
    sha256 "e67b7d6b13a6bca79f0ab8999f379b89d952e83e560a2aa3b70ef7ee34b8601b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/NichuSPN/bandit/releases/download/v1.0.1/bandit-v1.0.1-darwin-amd64.tar.gz"
  elsif OS.linux?
    url "https://github.com/NichuSPN/bandit/releases/download/v1.0.1/bandit-v1.0.1-linux-amd64.tar.gz"
  end

  def install
    bin.install "bandit" => "bandit-ai"
    bin.install_symlink bin/"bandit-ai" => "bandit"
  end

  test do
    assert_match "Bandit", shell_output("#{bin}/bandit-ai --help")
  end
end
