class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.33"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.33/rkat-0.8.33-aarch64-apple-darwin.tar.gz"
    sha256 "8339715a79a98e2fa07d2da783ac5cb2562177400e57fd881ae68777bcd95bd2"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.33/rkat-rpc-0.8.33-aarch64-apple-darwin.tar.gz"
    sha256 "bb8b4cff8bfc6d221a9789791634e390c859fe12c61df650875efafc801f4ee8"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.33/rkat-rest-0.8.33-aarch64-apple-darwin.tar.gz"
    sha256 "464b9c53f5d2b295b54465f76228d9c33221b27290a32f7f13e893393a85ac29"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.33/rkat-mcp-0.8.33-aarch64-apple-darwin.tar.gz"
    sha256 "7919970ee312d1ae5f6b27bfd56548626a7ca28ceca4ea70e70b80d0c9642a3e"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.33/rkat-0.8.33-x86_64-apple-darwin.tar.gz"
    sha256 "1ac639987acfec3c6e763e47859ce5075b72af1bf774efde0c7ae6e831f99e0d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.33/rkat-rpc-0.8.33-x86_64-apple-darwin.tar.gz"
    sha256 "764e500c9ebd651572a2bc899f7aec57c52be71ea61a5739db6a77f38f9bc5db"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.33/rkat-rest-0.8.33-x86_64-apple-darwin.tar.gz"
    sha256 "e4d0968279e678f071e279697b78e653f8deacfd261863ecbd7f7eebedc972b6"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.33/rkat-mcp-0.8.33-x86_64-apple-darwin.tar.gz"
    sha256 "e5fb417ce497afe4e6e20e88d2d337eb3f113b769d46a3c32639cb0f2dfbaffd"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.33/rkat-0.8.33-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "19c25239bfb91122002d02d475cf202503121939d0b0f3ed5ad93a9f80a45006"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.33/rkat-rpc-0.8.33-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "060ea40afef2929133f3481d49b6e2a7c979a064dca5b05b3b144df0eede2be6"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.33/rkat-rest-0.8.33-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1bca6bad9321c3d73f6116a7ce8937edc007664f1b007f76378267b4561a5c40"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.33/rkat-mcp-0.8.33-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6a660ba6be7bcd92c3b51646404bed93ee3debef6a4ee9273a200270e3da94ba"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.33/rkat-0.8.33-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8e8bba3f71ccb9071d3a7d5db9985515199757fafa741ca3b649423b0ec0fa81"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.33/rkat-rpc-0.8.33-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "39e8a32f20c3d29f95e8d5d1e3e49598efa05e5c08cd3cdc1e51783778e42885"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.33/rkat-rest-0.8.33-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ae129dee6aad0c225821b14808fc42d1f45b079f0e40079d8689c7d4d909b4b9"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.33/rkat-mcp-0.8.33-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3cf9c63df323afa8893a3157fdc800a208ca6191e9c42413f2ce9abd98018f3f"
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
