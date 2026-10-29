class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.9.7"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.7/rkat-0.9.7-aarch64-apple-darwin.tar.gz"
    sha256 "59f7aa4c04f1328f29d36b9afb1a240a2c66d6cafcddf9d93abf980d7d65391e"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.7/rkat-rpc-0.9.7-aarch64-apple-darwin.tar.gz"
    sha256 "2321156d21f0efce39035aaf44f2a071f09f3088277527481167e953d83296c5"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.7/rkat-rest-0.9.7-aarch64-apple-darwin.tar.gz"
    sha256 "c42d976b93d4abea278616e5fa8d161f97e9caed62750c54ca229d62f2a9674e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.7/rkat-mcp-0.9.7-aarch64-apple-darwin.tar.gz"
    sha256 "80ade05b4c49ae3a4ff089770a2f9b2dafa3843eb7bccbeff63da3a06dc1b919"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.7/rkat-0.9.7-x86_64-apple-darwin.tar.gz"
    sha256 "8365a78b989037507ecabe71943da5e5d0cfbd026cfe8866d1dd42a93ebbebc8"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.7/rkat-rpc-0.9.7-x86_64-apple-darwin.tar.gz"
    sha256 "a348b9346cf182df9c2a0674d833c60b6d93f7d2cb12181e7243643fe4f48021"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.7/rkat-rest-0.9.7-x86_64-apple-darwin.tar.gz"
    sha256 "dfb0b2e1c313f5fc365b3bb006f17176f043da5b63b20d55ad0365abbda8f815"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.7/rkat-mcp-0.9.7-x86_64-apple-darwin.tar.gz"
    sha256 "8fdda55e63d3fb6de6b70aec249abc28f9ed3a00688ff7076756d13fa4aec8bf"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.7/rkat-0.9.7-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ab2ee26192f4ccd9d88f984d1e2855598f9b190b9c0b8acbbbcbc7e411083c23"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.7/rkat-rpc-0.9.7-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "83392b028de616aa7f750805558a29b305475ff1c4ec1f7e793bfaade356e4ed"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.7/rkat-rest-0.9.7-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "46df3f99c261fb5ab69cc097de38d0cf13aab08514efe7676cdb6ecde4d7f27e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.7/rkat-mcp-0.9.7-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2dfb2b11b1a619b71cb40b206da877666536ecf63006aab48574ced822e68119"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.7/rkat-0.9.7-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "daa0a4b0d4fc70de907c90ece8144b0e3e30303a6dce63ddf9fa8bcab38fa8df"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.7/rkat-rpc-0.9.7-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "39146feb5f0d9ec2463e6a5b10cf5d73e3e0ffe4666a1a6cc5f200242d390b49"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.7/rkat-rest-0.9.7-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "91a8aff587f6e1bb1c2be7dea43e2d9b9cabf546a1118cc4f1d0696a7aa28306"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.7/rkat-mcp-0.9.7-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "943f6ee41b91619e2e8e297d83b672d44a0cff59333ac96ee02f9528fb7d780d"
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
