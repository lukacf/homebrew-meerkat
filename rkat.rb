class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.9.8"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.8/rkat-0.9.8-aarch64-apple-darwin.tar.gz"
    sha256 "a80cc8a499fe21860a818b49447b0cbc77481b8cdf3ceb8a36fc8cd3a852e52b"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.8/rkat-rpc-0.9.8-aarch64-apple-darwin.tar.gz"
    sha256 "5603eae62f952b259a6e840be83ba796ca0c2f602a23cc36ade1f8d4eec0ce34"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.8/rkat-rest-0.9.8-aarch64-apple-darwin.tar.gz"
    sha256 "f816351e4919a037d56a66f4b151962224a53c029d48ffdc96e9065875f3985d"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.8/rkat-mcp-0.9.8-aarch64-apple-darwin.tar.gz"
    sha256 "7d9fec3b220966f1aa1899013c725c0ef7033179008d2dffee4b4ed3a244fe08"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.8/rkat-0.9.8-x86_64-apple-darwin.tar.gz"
    sha256 "ac3993b1f784f54ace6521f36906b2032083637405764c9db693de24b5babed3"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.8/rkat-rpc-0.9.8-x86_64-apple-darwin.tar.gz"
    sha256 "79b94240ae7450f340a0612c5887f716462e222966a5da73764cb6e7279b1919"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.8/rkat-rest-0.9.8-x86_64-apple-darwin.tar.gz"
    sha256 "316e31dba7ec96dbf3ed3fe17d77942e7e6de0e92acb58263592195509fb9373"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.8/rkat-mcp-0.9.8-x86_64-apple-darwin.tar.gz"
    sha256 "7e419c09f106cb1a44f6d7d9939f33c9807a171812bb53b3dab5461a10e416b8"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.8/rkat-0.9.8-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5c1e684d66ee7f89c1b8f14bb6d59226de41641032e34fe21837766045fa7e9d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.8/rkat-rpc-0.9.8-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8dc8832df33e6b6732d36e6e6549b8849e0e60991fabc8b8ccc976085c3c465f"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.8/rkat-rest-0.9.8-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5e15ac55ea958f290cdda573a783f6ad89fa93ded984083b30aea4898b09be62"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.8/rkat-mcp-0.9.8-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8b7c8e8f5f21dd4e98aa5faa74ff0eaa84e463a7aa31dba1020d57676bccd4be"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.8/rkat-0.9.8-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "dda368b59d2fe8e634d6061a54eb7bbde5b2d0b79de22d58cb658a084207c145"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.8/rkat-rpc-0.9.8-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "200ecbc48fc3758a4c68648a13cc851ebb51b1e013eadb64aacf04be31587d2c"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.8/rkat-rest-0.9.8-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "10daab6c81385a0058d8a8ce15dad58407bb2d30b14901adb884c254e4740f15"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.8/rkat-mcp-0.9.8-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "89802d95c092b1b74502542fa3e3ad2d77a3f6cfee3d48d98e2576497a8a6800"
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
