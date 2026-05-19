class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.19"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.19/rkat-0.6.19-aarch64-apple-darwin.tar.gz"
    sha256 "53336dba0f9ea7c150c7bbf35902c82ed8ae15389f0ce32133ec03011b0f1f5c"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.19/rkat-rpc-0.6.19-aarch64-apple-darwin.tar.gz"
    sha256 "4a71c6f825fc356d55fc7ff628864cfccb300a2298095bb756a20e766e25128d"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.19/rkat-rest-0.6.19-aarch64-apple-darwin.tar.gz"
    sha256 "530d222d5c020b19ad1baa0b2d2301c3e29f38b9b7809a554307f3be19bddbb8"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.19/rkat-mcp-0.6.19-aarch64-apple-darwin.tar.gz"
    sha256 "0f3d658f938aa65abff7a4ee66c20899f49dead650fb48d76f58fc7e8aaa9208"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.19/rkat-0.6.19-x86_64-apple-darwin.tar.gz"
    sha256 "abafa0d0831256102e861e29e76c7e548529e74c68bf098c5a1e9d868c67d776"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.19/rkat-rpc-0.6.19-x86_64-apple-darwin.tar.gz"
    sha256 "28e7fa7430549f9662a6af92a9de6ada5434a604464a18f02657a7082de5c5e0"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.19/rkat-rest-0.6.19-x86_64-apple-darwin.tar.gz"
    sha256 "dde4a87fc948ce3c53d00fe7c06a87f26064f2232c2250888a0080bd7ba2f5ee"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.19/rkat-mcp-0.6.19-x86_64-apple-darwin.tar.gz"
    sha256 "9cc16010b6b5461ea3ec32bcb2e8d279835fa8c2cffe18cfebc05728f36a882e"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.19/rkat-0.6.19-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0c8f5a51f6875e2249bc36293000a6205264983a1daba3aaa806011b93f72085"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.19/rkat-rpc-0.6.19-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0c3404dab8ec3e803bb383659202bd59b0242cfb47b1d52c90a2b4c7a452d4eb"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.19/rkat-rest-0.6.19-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "fc3e8dae550294b73c60191590cc2c0a09ead4df480e492db0dd3775e3836278"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.19/rkat-mcp-0.6.19-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ed627bb2faaff122253dabe86de90c505ad7ff9d3f43b7d132fc1b32f29f644b"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.19/rkat-0.6.19-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4164998f85facf546960ee5e8183f87660c6ce79bc4aa73b0fecfbe89cb24756"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.19/rkat-rpc-0.6.19-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ba788a79b853b52e1aa4e542a8c52cb4b5b9b63e1563457839ecaa9fdb589c46"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.19/rkat-rest-0.6.19-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c5fc0f37dd31bdd1ac8895ed400a18852e3a6e5cfd5e7edcedf0495091302d67"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.19/rkat-mcp-0.6.19-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d3d724d661a7b57229c431bb2142cca9024616940aff15876de253da80d71885"
  end

    end
  end

  def install
    bin.install "rkat"

    %w[rkat-rpc rkat-rest rkat-mcp].each do |name|
      resource(name).stage do
        bin.install name
      end
    end
  end

  test do
    assert_match "rkat #{version}", shell_output("#{bin}/rkat --version")
  end
end
