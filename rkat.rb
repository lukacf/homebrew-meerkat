class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.9.11"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.11/rkat-0.9.11-aarch64-apple-darwin.tar.gz"
    sha256 "03b07f9651018d16429047b479e3fa3c8b818444c32ce52959765296b324b4e3"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.11/rkat-rpc-0.9.11-aarch64-apple-darwin.tar.gz"
    sha256 "663e3c8cde23e72a5ecfe9dc628df2187ef4635c2ab64f46bc7d9fa8ee4b6cb9"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.11/rkat-rest-0.9.11-aarch64-apple-darwin.tar.gz"
    sha256 "f34045ab4467b30dcc935dca4f505ebcb1728749e0622559095692d69b676b47"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.11/rkat-mcp-0.9.11-aarch64-apple-darwin.tar.gz"
    sha256 "327c964e68c75ac50504269339a5d5e8e7b0e02d46b057f95d4988b59eca9463"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.11/rkat-0.9.11-x86_64-apple-darwin.tar.gz"
    sha256 "b548716bd0bfdf7bd7b6aa4c331350f846f8d05603d7122c8630634d44af5cdc"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.11/rkat-rpc-0.9.11-x86_64-apple-darwin.tar.gz"
    sha256 "fe480e3cf89c504cb60f8d19cb3a0e6c6fc4207b2794495c852d22a26036abce"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.11/rkat-rest-0.9.11-x86_64-apple-darwin.tar.gz"
    sha256 "34f868cd76a399302bc61c6ef26ed3d29e21cdd3474337ef0d02c41fb7d4f1d1"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.11/rkat-mcp-0.9.11-x86_64-apple-darwin.tar.gz"
    sha256 "bce776f5d7325313ba579626236b73a9c04fb321c3241ebca7379f076e95ee9e"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.11/rkat-0.9.11-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8edba374354f75353af37072f9f3b3f12f22bbdfe49f75ef11cc964a2b457e81"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.11/rkat-rpc-0.9.11-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3599b46bf4f03c364e5ae563a8916b27c12bec12b5bab6ee865e91d618ad0ca5"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.11/rkat-rest-0.9.11-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a6907256d4fe00bb7fdd22164f0b671e0c5fbaaaefbffb6cb444dfc5595d75cf"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.11/rkat-mcp-0.9.11-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "17fdcc72873892731d9621963da79121e7c84b3cd4be914093fdde88a95c8d4a"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.11/rkat-0.9.11-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ef5f2fd36d33fbb7f97e0b9828966e13a74d85ceef0984e9251eb809bd74f3d5"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.11/rkat-rpc-0.9.11-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "60dbd8b46e9eb39fbfd71a60ab52a8529ae7688115f6fbbfbfa2292cd98dd12f"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.11/rkat-rest-0.9.11-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "afec702306be1722238869ebbc6ac3770360431994eb62b89a3e25789581f05d"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.11/rkat-mcp-0.9.11-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "803ffe670ea07624626fb9e09e4b6b3c8d6357c74a971eda31f970b49fbfbe97"
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
