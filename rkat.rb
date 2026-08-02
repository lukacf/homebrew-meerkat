class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.12"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.12/rkat-0.8.12-aarch64-apple-darwin.tar.gz"
    sha256 "afb125a39ff9e4c25cafd378dde5bda8b95988cdd87aaa8e1dfab63e7a2cef02"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.12/rkat-rpc-0.8.12-aarch64-apple-darwin.tar.gz"
    sha256 "920566cbab2e1239d693669418f8f9025ff495d4a6ecca94701954d17dc4ab68"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.12/rkat-rest-0.8.12-aarch64-apple-darwin.tar.gz"
    sha256 "4a512b86a35788f8a6f68d16729578233eea59b54ee799565cc525a56c109e86"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.12/rkat-mcp-0.8.12-aarch64-apple-darwin.tar.gz"
    sha256 "5b110ef9fb71f2b44b3b490137fbc5f9995c8827588480c758dd7a74e0b0f496"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.12/rkat-0.8.12-x86_64-apple-darwin.tar.gz"
    sha256 "c03213a763eaeda39607c4dfdfcccb94e93e6ed75da703a501293787fac3f65f"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.12/rkat-rpc-0.8.12-x86_64-apple-darwin.tar.gz"
    sha256 "9af566abc3a1287a720840e47db93adf0345b8be7c2db93707c82f71aceba1bb"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.12/rkat-rest-0.8.12-x86_64-apple-darwin.tar.gz"
    sha256 "594c3385a74dcaa774bb5474042688ab373d62bb651ef6024c65c1c150f8bbe7"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.12/rkat-mcp-0.8.12-x86_64-apple-darwin.tar.gz"
    sha256 "f1d45f1e10e81c9102d942662edfc5b2f320593bc4f795a8e9ab9bbbc0318efc"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.12/rkat-0.8.12-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b9fb496dca543d9b46bf726fd5e00e75cbc77f78c72e3d4ca4d4155bef4602cc"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.12/rkat-rpc-0.8.12-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f2420e83bd2cde0d51ea7438ba04380518ea9e9d03eb722ed7b8c590e0fca88c"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.12/rkat-rest-0.8.12-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8250bdc77c70f1d51288842f4730450a7ac086bfb356c0a403febfa157d0bda8"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.12/rkat-mcp-0.8.12-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "819bccfd3c2d3e4e0f6bf73ae5217d6ca244c5818e339509600b793b0f24c1fb"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.12/rkat-0.8.12-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0e2008614ba35779299df9de9a3aacdcd4008bb9b0b2947533e0a14f2057be86"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.12/rkat-rpc-0.8.12-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c39492b0f1f865447fb23316218f979e6a9c3b33bb2dd541cc08be2034b0da64"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.12/rkat-rest-0.8.12-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "edb31f5a81d135c9549222c8d76043b3310d4fba089ad704e0ef2ad94ba50655"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.12/rkat-mcp-0.8.12-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6f67916e500cda1c8ac0ed8b3952858359addb3a4eee54d2ca33ce380e8696c3"
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
