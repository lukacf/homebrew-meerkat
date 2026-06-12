class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.1/rkat-0.7.1-aarch64-apple-darwin.tar.gz"
    sha256 "c5613122c19d5363de1d5781a9faca71acccfdf598556b105f2af0b565fd79d1"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.1/rkat-rpc-0.7.1-aarch64-apple-darwin.tar.gz"
    sha256 "15a39f1381a304814fab81113834cdf61ae9f68e30cbce268f47dfe00cd2d295"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.1/rkat-rest-0.7.1-aarch64-apple-darwin.tar.gz"
    sha256 "8d5a9f00f04409463b76ee53cb21d367d34bd9fc45afb1a37f96855c896fffc2"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.1/rkat-mcp-0.7.1-aarch64-apple-darwin.tar.gz"
    sha256 "c0ed8b8368f01a351b80ab5db2e4b7d42b81312cbc63b03f3ed3d882fec85edf"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.1/rkat-0.7.1-x86_64-apple-darwin.tar.gz"
    sha256 "fe9e573b9d18e72bb37f1dd497e22d7a81c809e309b8d442bad3b68a3aeee5b1"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.1/rkat-rpc-0.7.1-x86_64-apple-darwin.tar.gz"
    sha256 "a2b70323a81744a3c86ba6417bbe2e711fc0d790172f88b80e1707fed05e6c87"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.1/rkat-rest-0.7.1-x86_64-apple-darwin.tar.gz"
    sha256 "b13893c60d121b4f2eaee9f80591404f9e958dbd4d26402d4740ce118e449272"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.1/rkat-mcp-0.7.1-x86_64-apple-darwin.tar.gz"
    sha256 "8ded7166caa69f35e3f8b937f38c49fb57d4493cca061a1dffca35f6cc544b06"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.1/rkat-0.7.1-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8fbfdf1cd3d008a84dd8692f15aa5444e70942ecfabd7e0632e9facaf6b2a3f4"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.1/rkat-rpc-0.7.1-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9bbf49878c60e51375324e411c3dcaa54f19c621e95c567735b44b3a60a59c96"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.1/rkat-rest-0.7.1-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e7520a833f3f81a47c7f35ea25c787e83626a8febc006ef9c4d6f180b3d536f9"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.1/rkat-mcp-0.7.1-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b5840c3b72b2d7c1ad192ec004e52f2b52c1c4c07fe4fd713409d553a86c802a"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.1/rkat-0.7.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "59331c0c858d9f06e5f94fbfd7af7a5b8a724ff91bf4cbee892e016110006d58"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.1/rkat-rpc-0.7.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "44014e388635188b406bdcd08fbd7176948f96dc0d41cdbc85b81586ac5c3930"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.1/rkat-rest-0.7.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3b822fba752b39c4f370f7c38e8396d6d7d388c054a32a3ec45a7378c9732876"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.1/rkat-mcp-0.7.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "377fe4865ef19afae7f27e2feedea6b52569e54c79d3fbf2161b945e04c9e7ab"
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
