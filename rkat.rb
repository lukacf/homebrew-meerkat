class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.44"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.44/rkat-0.8.44-aarch64-apple-darwin.tar.gz"
    sha256 "0d02f460fc7d383f85fd686c6be771b90905816060885afc73b10a401258ae9b"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.44/rkat-rpc-0.8.44-aarch64-apple-darwin.tar.gz"
    sha256 "a792e7e2be583859ae693e38a6d85d5a3e3b667a1201c381d804f8323705e0b4"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.44/rkat-rest-0.8.44-aarch64-apple-darwin.tar.gz"
    sha256 "d18e024575d569a9a87bf0aa5b6e5cf32bf9c503143db61b0ce0e69995f22506"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.44/rkat-mcp-0.8.44-aarch64-apple-darwin.tar.gz"
    sha256 "cc69b11373d624f20152e07d102aa7498b58e4d424540b7e43030bd43d3e5e0f"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.44/rkat-0.8.44-x86_64-apple-darwin.tar.gz"
    sha256 "11131d973016025493299e6bebcc3cab215bdaa2a59da17fe1fd0ee4f82fac97"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.44/rkat-rpc-0.8.44-x86_64-apple-darwin.tar.gz"
    sha256 "ff1208bd40d3d2b03145c01ac947f119665b95dd1dfba19b079061b5e22744e8"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.44/rkat-rest-0.8.44-x86_64-apple-darwin.tar.gz"
    sha256 "c88cfb097d1c637e003e4d34476f9d5799d93dbec0552ee2551ffe216f327b1a"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.44/rkat-mcp-0.8.44-x86_64-apple-darwin.tar.gz"
    sha256 "44642328bf3c45e8b7715707c713553564a0beeab43678893c2f6e3751b164d2"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.44/rkat-0.8.44-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "dbfcca963daabd1bfd2a7ea25341eba5359c352896caf7d4df9e6cb8dd9ad7de"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.44/rkat-rpc-0.8.44-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "64c2a76371f755b54816a6a46836a3bce613c5e1a860a2a0890b316cd15c2378"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.44/rkat-rest-0.8.44-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0c89c41282844fc86634d297251518d09d8fb2cef98de438c5e934fbc64b6dbf"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.44/rkat-mcp-0.8.44-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ed0f211d8b22a279f9ff44a151e6d8f110a857c315f16b8e86a3450db64c2bb1"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.44/rkat-0.8.44-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e7dfd3162e42e883fc79ec618a6a9d39bd183240aa9c8d223742b41f15437ac4"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.44/rkat-rpc-0.8.44-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "992af6a91b25e264f18e2f4c1324a7d4eb9710b02fb899c40ea2c4e525d83871"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.44/rkat-rest-0.8.44-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "94ac93ad61305c01a5f8a9d806f19419af44791a13d6d9f666714d475b432018"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.44/rkat-mcp-0.8.44-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c67a9b41b8c387ee09a14ab3c12b782362bd5f14c1666c8fb2de182f8e186e28"
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
