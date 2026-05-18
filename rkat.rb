class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.16"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.16/rkat-0.6.16-aarch64-apple-darwin.tar.gz"
    sha256 "09a9e853bce5bd2a1187420e0c7ce790678b46ca6e87dd7d832256f763f938df"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.16/rkat-rpc-0.6.16-aarch64-apple-darwin.tar.gz"
    sha256 "46e712332be002c9fbb3e7926776698c4be35b8c4d10a84fb51bb98caa9ac76d"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.16/rkat-rest-0.6.16-aarch64-apple-darwin.tar.gz"
    sha256 "1e75e2b7720fb4293f155865166b3ca9d0d4d23c409a0892f0790e15fa64d12a"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.16/rkat-mcp-0.6.16-aarch64-apple-darwin.tar.gz"
    sha256 "5129b383b0e8262a3319c97a85614a1f8a58aeb2f2d9d8dc7893fe394bf30565"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.16/rkat-0.6.16-x86_64-apple-darwin.tar.gz"
    sha256 "f6071004690d7b8d7ce3354c060769b0c27f5e73b639cf4128b09880f00cae97"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.16/rkat-rpc-0.6.16-x86_64-apple-darwin.tar.gz"
    sha256 "e9716e978aaa6e0f085d70b83d902428ac2acf4e7c3b46a379a6c3ef574eb802"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.16/rkat-rest-0.6.16-x86_64-apple-darwin.tar.gz"
    sha256 "42be85b0a8d02b141a7740036083e40cbe395a19fe2607f7a9261fe29ba6722c"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.16/rkat-mcp-0.6.16-x86_64-apple-darwin.tar.gz"
    sha256 "8bd3eca03c039183586587687aae93a8903ba1150f4cd6fc1c7ff46760753d9c"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.16/rkat-0.6.16-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9987d81b8294e3f95b97f75689dbdb4899cc3fc4c35b2e7753c40a2259aef448"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.16/rkat-rpc-0.6.16-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d9c728a000e6d4384cf39f3606dc870bfd21fb08f5141bfef629eae1d5c2222d"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.16/rkat-rest-0.6.16-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "99e1a058d956d8fdc4e93350e9d1da996bad9c5ed851543c69ccdeca03954be7"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.16/rkat-mcp-0.6.16-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "40663d23e093d65fac3128870194be142de5ea4ab97743dc5d4d385920b1956e"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.16/rkat-0.6.16-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f15b5c80813dfac6d727de3d37776a9b33a26ec05abaf0ac584c2bbed55616e1"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.16/rkat-rpc-0.6.16-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "70b2d0e906ac15e3a4dd2a57a99e96226ccb7026680cc44d5531e06927cc1e1f"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.16/rkat-rest-0.6.16-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1e425de7fcaacbe9d020d872bc3872fa9c8bfcef9505d96ebe65bb9c4ecd27f9"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.16/rkat-mcp-0.6.16-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5e6bd227ed2daef819197231da22f43ead5dbd23ced91004ec1b1e80210bb3d6"
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
