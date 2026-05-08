class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.4"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.4/rkat-0.6.4-aarch64-apple-darwin.tar.gz"
    sha256 "d8c1ac0a7b9928ea70c68a701d6f198a5dfc5f3478fbcc43efaeb297da0e287e"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.4/rkat-rpc-0.6.4-aarch64-apple-darwin.tar.gz"
    sha256 "705ab003b4378fe5ca46cb4cbcc7a5e0b6a630a352bd1d9e47efab49f28242ab"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.4/rkat-rest-0.6.4-aarch64-apple-darwin.tar.gz"
    sha256 "6ca79fa49ec90853fbb8593ef5578c1f8c987102102f7562193edb8bf6abd62a"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.4/rkat-mcp-0.6.4-aarch64-apple-darwin.tar.gz"
    sha256 "88f06f36b900cd648005328fde32a29d3e5885eb9cbae9cf8fa024e6cefb1fae"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.4/rkat-0.6.4-x86_64-apple-darwin.tar.gz"
    sha256 "38484abd10803a36e35abdc9df7a5d0ce07f22c291f4a747c6ec25c1280c01a0"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.4/rkat-rpc-0.6.4-x86_64-apple-darwin.tar.gz"
    sha256 "028042a87071e9430bd1415463d2b1e9c0d53af4b37120114fc81c14e2729457"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.4/rkat-rest-0.6.4-x86_64-apple-darwin.tar.gz"
    sha256 "bcf389b18e7f7f4315aa6564be40d77d37de74b78466d846d6a5012bc7f80ea6"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.4/rkat-mcp-0.6.4-x86_64-apple-darwin.tar.gz"
    sha256 "0fb73b04da9acc7af328a273795ece3ef325fc4e381e5e184f1c2a5cae53c681"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.4/rkat-0.6.4-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9fa856b9892de18f34024dff8f8b8dcb85210be4f1bea399c03ded8e06edb7a7"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.4/rkat-rpc-0.6.4-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "063b21474d3be0a0ed35cdad1846b91ca036f7b658c420358f3416322db895ba"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.4/rkat-rest-0.6.4-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "25e10d767a8f5bde098f7f02304571eb94a8a012bd4b38b3d13229b8f2dc4d63"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.4/rkat-mcp-0.6.4-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7ca9dfb3518c1fb93e1af2f2f4c9037e7353c67aea7a56e715e865a296b58462"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.4/rkat-0.6.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b7483d6be412bdb31e42d33c23375615bf7c54c57a3d0b9498bf9e801217a99e"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.4/rkat-rpc-0.6.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f084c12f15b8e0be680431f40947bc2a09fac083fc343f00979c6035656acbc9"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.4/rkat-rest-0.6.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3018afd94c5445b2dfae2ede8eeca725cbac52abcddd83a6ba86078ab09f0a63"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.4/rkat-mcp-0.6.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d3fddf5696086c83347407ece7ad6a16b577677acbaafdefd448671ea6c81b82"
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
