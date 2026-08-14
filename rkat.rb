class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.22"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.22/rkat-0.8.22-aarch64-apple-darwin.tar.gz"
    sha256 "8c48ab382867b6a801875aa40354e76a74d7015d263a06d3850f740f6345c86f"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.22/rkat-rpc-0.8.22-aarch64-apple-darwin.tar.gz"
    sha256 "96c9004928e444815ab4526f85126b0451895cd35bf9959089f4d881d6a5257f"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.22/rkat-rest-0.8.22-aarch64-apple-darwin.tar.gz"
    sha256 "293eef8a4fab648b24122b3da5c6fae482337d394eee56dfee3899dbab160908"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.22/rkat-mcp-0.8.22-aarch64-apple-darwin.tar.gz"
    sha256 "1d4fbc780dd9a6d19f8779c5b538048fb7f4c8e64ce89521f3bfe89ea417a4fe"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.22/rkat-0.8.22-x86_64-apple-darwin.tar.gz"
    sha256 "1caaa56c88127b045f480958a4d574e06b7934eba73df506d550a616f3bc4f86"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.22/rkat-rpc-0.8.22-x86_64-apple-darwin.tar.gz"
    sha256 "e1be7d7f4bb8b8ca7f7375df00ab475170a0f622df553d5d541475abb2dcf6d6"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.22/rkat-rest-0.8.22-x86_64-apple-darwin.tar.gz"
    sha256 "35a47e29574d60e1774c425bf5e746e67f6340bbf8626d0d04c22ad49a890cc0"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.22/rkat-mcp-0.8.22-x86_64-apple-darwin.tar.gz"
    sha256 "a56ef075dfe700e30ec8896d50d3e8e678f598310d92131a9b2e29dea40f4fd3"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.22/rkat-0.8.22-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "78fe737396d6c087a7280d7b7afa0cc1b01861c1bbc22c7a117056bc8dc254aa"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.22/rkat-rpc-0.8.22-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "cd82cff7b3c4ae09761227531810290b263554349c20dbab1966e0803bca43fa"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.22/rkat-rest-0.8.22-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "89e7fa037e465fbb732a0a8f15c3537404b6ace48fd6456ec7b2f291d13a92e3"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.22/rkat-mcp-0.8.22-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5877f5d312a0071028a1cc292cff7fad1808e1204b98d13c6218a0c60246aa4d"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.22/rkat-0.8.22-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "216b7a8816e9df800c0a4871bce0d97ba495299be2b4a72b6b7065a0a6d4f2a2"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.22/rkat-rpc-0.8.22-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a9f89649bc0854dbee842560871dbe6dd0770d07f2307aa6e50e731279b9d671"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.22/rkat-rest-0.8.22-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e4e7d112edc824b5dc24472e56ffc3e1155aaba6453cce8ecc7041ee09d4b2a4"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.22/rkat-mcp-0.8.22-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1c63379dc19b4aecf6621b246dd368cbfa43329bc514e13b97bd20f8c5d62182"
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
