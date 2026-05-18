class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.15"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-0.6.15-aarch64-apple-darwin.tar.gz"
    sha256 "2a0b4e6d4389a225a8d8e9195089ff2b48ff26d24b233cfb1c3b240f80a16b30"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-rpc-0.6.15-aarch64-apple-darwin.tar.gz"
    sha256 "181a6eee5bbeeea16f321258a82bc72eba209cd7083ddf263ca762ff21224f44"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-rest-0.6.15-aarch64-apple-darwin.tar.gz"
    sha256 "10fe86462fdc29b938d08845719b9657a1d8c72ca1a8043b1910f27a62325101"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-mcp-0.6.15-aarch64-apple-darwin.tar.gz"
    sha256 "d2bc3c6de480eb3ca88a23a957091b6b9ad59d6d744dbba791e785c2dc4e10e1"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-0.6.15-x86_64-apple-darwin.tar.gz"
    sha256 "fc755d541f1005093da7397a20bc878cb7b570613233532da05cdf128fda29f8"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-rpc-0.6.15-x86_64-apple-darwin.tar.gz"
    sha256 "0a0d1a789317cb5ac0b15c19ec2195adc7baa0a491e68a3093d92efa68d6eee5"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-rest-0.6.15-x86_64-apple-darwin.tar.gz"
    sha256 "668238e639c118ecacd079e1f7687130047687d9c1052d27d6fa4e83f4fdf517"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-mcp-0.6.15-x86_64-apple-darwin.tar.gz"
    sha256 "a689ef56a0544eb92021616b9b7d79ef73cb46a78efd25ab9ab0033c2e481984"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-0.6.15-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2fdac8f61489cf428c9034cf685c1dd345be5f1aedad8e69ecc25f1c67ffd223"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-rpc-0.6.15-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c9eec58bbc6ce0aeef35c1299ade329107c433cf8c96a17533bd734f1c160294"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-rest-0.6.15-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d2b8f0a1e43530275a425923cad5af28bca81ec59079cd31ecbb661f4b3bd897"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-mcp-0.6.15-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8d6ce3b6c27aefec55bda2fe4f93eda25f73ee2b32d054865cb28b86dc32359a"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-0.6.15-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bc2b6cff067f38d6327874e6e17c848317b855b2eb9d69f8e0a3b08daa765e0a"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-rpc-0.6.15-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ec923163bd5d9cebaf86b28b0ce5c578241c94d5af57fd75c5961a7b21446aa2"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-rest-0.6.15-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "31e14a5222cd6967c1a01b9309d0e05ca2e46c0ebe6d7d880197c695f2de7e16"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-mcp-0.6.15-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9187a55ab66c83f8589760b13c663c6b11ecf4f5c745bac04ab0e75ae1c42052"
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
