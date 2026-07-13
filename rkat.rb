class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.7.31"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.31/rkat-0.7.31-aarch64-apple-darwin.tar.gz"
    sha256 "1879c065ba1870abf32be8d52b01c499b86857d4d462618a21def6c5d5c22b25"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.31/rkat-rpc-0.7.31-aarch64-apple-darwin.tar.gz"
    sha256 "e6a795ca25522c926b55b429e4415ae9e8c45b52bd1d20c543c74af797a5b772"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.31/rkat-rest-0.7.31-aarch64-apple-darwin.tar.gz"
    sha256 "a9b10b520c32dd1f2b6ec18ce542d04a8f007f390af3e6d6cad590e4e4f465c2"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.31/rkat-mcp-0.7.31-aarch64-apple-darwin.tar.gz"
    sha256 "ae75487d8baa0e12584c3246626d09d466fe87c48c6442b7226316028b103aae"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.31/rkat-0.7.31-x86_64-apple-darwin.tar.gz"
    sha256 "f945bf16019f17a1b6760faf6f8369dd0310bd6973a86e92d72936841c842770"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.31/rkat-rpc-0.7.31-x86_64-apple-darwin.tar.gz"
    sha256 "7d59aa55b2f4f88fa466b3779e1d7245ad6e8fe5f5b12c0624dfc1ada85900f5"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.31/rkat-rest-0.7.31-x86_64-apple-darwin.tar.gz"
    sha256 "44f9af0c139672714b19575615dd098ee9dbf28e1b4cb3af72bca8dc03a297b3"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.31/rkat-mcp-0.7.31-x86_64-apple-darwin.tar.gz"
    sha256 "1ae21a117299be7c9091eff14d7b8c6abe8ed2795261b2b5ee0f0243d82f84aa"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.31/rkat-0.7.31-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "57325a16802d7ab54719dd6d06a6f932ee1e39e5856bdd0eae29396ec3998c6b"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.31/rkat-rpc-0.7.31-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8501e07394b99a107bc92a476098b37dd9fc37e5a9e63d9abc8bb1783bf7a2b2"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.31/rkat-rest-0.7.31-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "64b0c9de708d9c36e2877aa2f6d539001df95acee42f0b5250772ede1efaab31"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.31/rkat-mcp-0.7.31-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "475189c052e5d68244d8283025021596b00bb107c765025364a265c9e1395a67"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.31/rkat-0.7.31-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d7acf4aae34fb347355bf31aa95e93a0fa859c1150ca0772733eed9a3d71d5ad"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.31/rkat-rpc-0.7.31-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ad7608984647436f5764cb524647ea71ffd49516ca94fa3e855dbfbd94ca3aa9"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.31/rkat-rest-0.7.31-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bcccf6c60bae7df0f1b27f7f6e5a9da624b80019f08d60b1a9ebaf8062f7e4d8"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.31/rkat-mcp-0.7.31-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9080712498b1c9ff8c136c1fa589e4772f124d95508aec4d322dadd129e46b18"
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
