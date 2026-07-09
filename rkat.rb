class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.7.25"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.25/rkat-0.7.25-aarch64-apple-darwin.tar.gz"
    sha256 "83db5b51e837d9950f687609e68868f297a7f09898965fe8ee7bc6075e5fc4fc"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.25/rkat-rpc-0.7.25-aarch64-apple-darwin.tar.gz"
    sha256 "a99b089a731d7005261ec62ac22320878a55ea98df3555b69ccef05cce4dabf6"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.25/rkat-rest-0.7.25-aarch64-apple-darwin.tar.gz"
    sha256 "b59441306c18c44291f8adc47c0420c1370b9ce2f749a132ebe45c44f027e3de"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.25/rkat-mcp-0.7.25-aarch64-apple-darwin.tar.gz"
    sha256 "2961609197717c36bea952955c5ad79dbb01bf25a63c81d6f70140f6b36995a5"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.25/rkat-0.7.25-x86_64-apple-darwin.tar.gz"
    sha256 "bc2dfcf50ef1f2c3d3f26439d43dc2e38df1e3f1551a7b9fee1cc675f0af3f19"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.25/rkat-rpc-0.7.25-x86_64-apple-darwin.tar.gz"
    sha256 "e6160501f9b6b678b01ed11add1b7aab90f2144e10283f82fd5413746cfeabbe"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.25/rkat-rest-0.7.25-x86_64-apple-darwin.tar.gz"
    sha256 "62de105f0273556a68b849bf3ebe4e47ccdaebc1d51ff52eb2a1f78767f68f4b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.25/rkat-mcp-0.7.25-x86_64-apple-darwin.tar.gz"
    sha256 "c74a96732a8ef015ca17535b6c1bc55b34c0e2882c3cff3dceacddd4f1625368"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.25/rkat-0.7.25-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d879fe27f463d0dfe1d49c4ba257e48f19dc8ae430000f28c384d9ebb78fe7f2"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.25/rkat-rpc-0.7.25-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "68b5d153cb282604fff3e75e7a5ba80c97bf8994caffc468fc244b061d3e4652"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.25/rkat-rest-0.7.25-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9b983de088402978cd975fc08afc82191ddd16e1b324232913b2ded4e9e448f6"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.25/rkat-mcp-0.7.25-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "08cba405a9cb795e4c585efab3b3822c9637c127060b99f255c89a705f31c51f"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.25/rkat-0.7.25-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "666fe096917bc87344bb2cef9ca5d0794bf2a0a2d9bc7ae547421b05a52e61f8"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.25/rkat-rpc-0.7.25-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "afac36630c83b238803d457a5665df2de5fc2c8a948d2d490c6ea97935117e5f"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.25/rkat-rest-0.7.25-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f80c4f429cf9c0e2328e76b8fa101cf8e27a7152a477061cb25445d30b319cf4"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.25/rkat-mcp-0.7.25-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1fbaf365f81f84966727c295ad4ca880826a7683b38a956b9b835bcb764439a1"
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
