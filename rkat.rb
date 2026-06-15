class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.7.4"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.4/rkat-0.7.4-aarch64-apple-darwin.tar.gz"
    sha256 "1d33750931cf72b95613248274bb7df5ccd9054766dac134d14aca7e251344d4"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.4/rkat-rpc-0.7.4-aarch64-apple-darwin.tar.gz"
    sha256 "96e596a43bb8ee165b88707e198412e4cf74899a2a8270a123d3d8e08198a1b9"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.4/rkat-rest-0.7.4-aarch64-apple-darwin.tar.gz"
    sha256 "d80aa25fcf23f18d2a269ece027313432726adef70588758cccc992aa33513a9"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.4/rkat-mcp-0.7.4-aarch64-apple-darwin.tar.gz"
    sha256 "1513b1257268b472112aae5edb82f96810bb03e9561c6d1a3f04038f3c398a4a"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.4/rkat-0.7.4-x86_64-apple-darwin.tar.gz"
    sha256 "1c3a20582b432192cf57b8b68c02342353d3bdbe72bf56157a50182db782680c"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.4/rkat-rpc-0.7.4-x86_64-apple-darwin.tar.gz"
    sha256 "7505144aaea5deb7d110edb38674a78a598d123de48bac10862e0b30e7ed01b2"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.4/rkat-rest-0.7.4-x86_64-apple-darwin.tar.gz"
    sha256 "cfc50ab8f6ce9ed1cb1ef3a2ae723090611b5639553651855fe35f37b2c1e333"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.4/rkat-mcp-0.7.4-x86_64-apple-darwin.tar.gz"
    sha256 "1b5901c5f03aec2603075c3e2d8c5e1f3792443f24b0069451836bd532c25119"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.4/rkat-0.7.4-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f6cd0fc01778855098c99a60032101fb7d875d8fe7ef4ce943b52042ad704a42"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.4/rkat-rpc-0.7.4-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a9781e7ad19ddbbe7f5dc59973f8f2bcbb6e5d027699778e08648386d4c2fca2"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.4/rkat-rest-0.7.4-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8aa48ca3aefdae4d44bc91d934e9a8c0aeb828694c93acea8a565de8262f8e2f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.4/rkat-mcp-0.7.4-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c78f17775fde3bec6d6f57609c607962822d42b2fcde4b7a05b65a4c404f5261"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.4/rkat-0.7.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c1bc1cb00f7ef222c67eb2140573ae1dca8d606c9ede19372b4bc3bb3467e1bf"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.4/rkat-rpc-0.7.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9a3d0f3e9dbef48146599ad2995cfe5eb4dc10179ae23898b14213a314c5c92a"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.4/rkat-rest-0.7.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0ca5ac55e5d2c2ddca56b72c06b2f8bf6453f1fabfebe25a6a0d436195300ed2"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.4/rkat-mcp-0.7.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b1f5554953a938b7e91d53379699e7b5255d934ff976851b5f6740f81ad2a541"
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
