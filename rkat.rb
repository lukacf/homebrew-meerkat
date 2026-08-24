class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.27"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.27/rkat-0.8.27-aarch64-apple-darwin.tar.gz"
    sha256 "08772280bef8ba755f090a68477d174263a2d3a2a8bcb97b585b13aa3990f8b5"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.27/rkat-rpc-0.8.27-aarch64-apple-darwin.tar.gz"
    sha256 "bc5fd539b532ef6abd214da61d0b9aadebc16171943b3d6b60b4514ce92dce5e"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.27/rkat-rest-0.8.27-aarch64-apple-darwin.tar.gz"
    sha256 "1a221fd6d2a42a2efc92bf4f1b3ddaf172338c88f81ec7a4897129c359f2757b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.27/rkat-mcp-0.8.27-aarch64-apple-darwin.tar.gz"
    sha256 "1186a916524e26208c0abaf2375d245d72586877d035164445daf70a0f02c73b"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.27/rkat-0.8.27-x86_64-apple-darwin.tar.gz"
    sha256 "24b5a11dbd2be377a3ea30474757dccb6c72bb796cf87158f8102e3c8992c4e7"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.27/rkat-rpc-0.8.27-x86_64-apple-darwin.tar.gz"
    sha256 "f2d454085e7a7508f10edc91f582aaf4900dc7486f4df6a0bd0d76583d601b30"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.27/rkat-rest-0.8.27-x86_64-apple-darwin.tar.gz"
    sha256 "5f2c420960586828fe42e77e09a51f09b530eac1111d0b0e30bfcec6d979002b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.27/rkat-mcp-0.8.27-x86_64-apple-darwin.tar.gz"
    sha256 "29eabf0a1826d919782d8f9a5b4f68092c5723b92a3b9493cb01f99141c64a1c"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.27/rkat-0.8.27-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3e8b6a159cce967d7d2421511a263689ff797c525201e0178d89ebc8ed203352"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.27/rkat-rpc-0.8.27-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "fd7327f7561a1658b07bc9f6e6932f7158a4a6cd5b7d82238fd51701a227d23f"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.27/rkat-rest-0.8.27-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ad1217251d6aeecb8cf0264e89df1da3974603da0e974b75c0f3694f073bf19c"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.27/rkat-mcp-0.8.27-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "bd5439cceab7d7604a653f020c4ceb34ff845ce7454db01878e1fb57b81f8ae2"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.27/rkat-0.8.27-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b853e24f8bf0e8b0166dbf161930ca22e010c3b4bf225dfdf4ca8c06d7233bda"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.27/rkat-rpc-0.8.27-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "61144c52af4c7af6d3479da895ef6f0e62408b8c201a6b43985f00c4d1ed8d3e"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.27/rkat-rest-0.8.27-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6639ed7dce15dfa259d95edef0abba46d2a06b94e4c24748ad1224e87cf87f45"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.27/rkat-mcp-0.8.27-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5c31e3b0cdf5dd9aeaf3550e04249f4d35945a59786c41f3109415a1063a5a87"
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
