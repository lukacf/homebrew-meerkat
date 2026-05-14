class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.9"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.9/rkat-0.6.9-aarch64-apple-darwin.tar.gz"
    sha256 "cfab629c703ebc12372d488998ec43e7573742033dbf25ebcf9d7123312393c6"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.9/rkat-rpc-0.6.9-aarch64-apple-darwin.tar.gz"
    sha256 "809c933fac2a543c9c48745d619bacbfdd2706021e93a34747e89367571c7d35"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.9/rkat-rest-0.6.9-aarch64-apple-darwin.tar.gz"
    sha256 "6ad9ac6b56f6537f1d7d2d10ed90e9f1f460534ff794316d5ec17f722763b304"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.9/rkat-mcp-0.6.9-aarch64-apple-darwin.tar.gz"
    sha256 "ebe70bd33f2c197e557760d94cf418fbd1d7f4daaa899118b77e1fe2d941a15d"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.9/rkat-0.6.9-x86_64-apple-darwin.tar.gz"
    sha256 "cbae72eb61625ddf5498081a7336fd4c254df9d32738896d2e91e6f297761662"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.9/rkat-rpc-0.6.9-x86_64-apple-darwin.tar.gz"
    sha256 "ab2e3e1c55513ef59a7223bb6d7470add074bc39538b672e552841ca91507f84"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.9/rkat-rest-0.6.9-x86_64-apple-darwin.tar.gz"
    sha256 "fb9ac2cc05b3e9f229263930712cf52005d3cca33af3a9b46847741e5f34472e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.9/rkat-mcp-0.6.9-x86_64-apple-darwin.tar.gz"
    sha256 "32cc16f4eb18fabc5c7ca7b51666fd002c347e1200b2fb87e2473fe2d23c611f"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.9/rkat-0.6.9-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "04631374f502517b3446e7bacfa896323213efa572d1501cd01edba7d9c7c7c7"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.9/rkat-rpc-0.6.9-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "75dd24297a879a75c2b283d60225f51f9ab36a478354d4e5c64fdb9c675e1fdd"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.9/rkat-rest-0.6.9-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8b78643b015f1e83b5623122ee91dae20b2a16dcf4b19524c320c4c67247acec"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.9/rkat-mcp-0.6.9-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a5f1775e53d2377e4a4df12356b64eaa05f95fc18048120f21c43cf0ebac41cb"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.9/rkat-0.6.9-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "709f7ce2e6fc4e4bb5796b7ae33b9a69f3008903e6c3b6dd97102d86f3699f34"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.9/rkat-rpc-0.6.9-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c5104068aa576f6a6d47b3885a7cfbeff5b5a1e97ce41532fa479d77ff7b2d51"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.9/rkat-rest-0.6.9-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f873501d972b58222179d101d69dd52dde585e00fc4bfd11b5d50f4307ddbe9e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.9/rkat-mcp-0.6.9-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c5c031efb9816fba220cfed9e2fe126c53faadf8df0ff0d7609a833f196dacf3"
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
