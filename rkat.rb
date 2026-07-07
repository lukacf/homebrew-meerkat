class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.7.19"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.19/rkat-0.7.19-aarch64-apple-darwin.tar.gz"
    sha256 "6db146b169b9cd888ff9fc5d6aa908e887b162e6b1db3815c7bd499cb586ca20"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.19/rkat-rpc-0.7.19-aarch64-apple-darwin.tar.gz"
    sha256 "d88f113c535a96215286148c987ad587a471b8d095f94331bb9a327336a4d985"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.19/rkat-rest-0.7.19-aarch64-apple-darwin.tar.gz"
    sha256 "5884ae5cfa488cc9da2d8f942f50ad1a2176f78cc06f5e1c728006628899231a"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.19/rkat-mcp-0.7.19-aarch64-apple-darwin.tar.gz"
    sha256 "f0efa1070e23f2e5598ddc85dbc2443139c294c813ab993af84c5a5e68610086"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.19/rkat-0.7.19-x86_64-apple-darwin.tar.gz"
    sha256 "999370cafec6ef122c218a58f0c1c883bef4e688231a5caa78eba2169bd9c86d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.19/rkat-rpc-0.7.19-x86_64-apple-darwin.tar.gz"
    sha256 "f1bf9499e4dab0338da9b672498bfe8b8ab096a301c65f0c3903f5536a27ad99"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.19/rkat-rest-0.7.19-x86_64-apple-darwin.tar.gz"
    sha256 "5b7bfa52f96cd2fd024349f87d10e9a865935a8927a30d755fbd228b97bbe2cf"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.19/rkat-mcp-0.7.19-x86_64-apple-darwin.tar.gz"
    sha256 "72aac7e0cd71ed6004ad24bb55b8afa542ecf10b8bb3311716d008d70570579b"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.19/rkat-0.7.19-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2342ad3b39e045fc0c8506ee25b0fb743474e04c967977075666e487f18b95d7"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.19/rkat-rpc-0.7.19-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b6222f31fa75f5a6006ac74c896c823ebcb306648a946f43c68f7ce0c2194911"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.19/rkat-rest-0.7.19-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "60fe9cb8f0c714a4bc22e1292ea00e6193898542f400eca3684815ab39d78c8c"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.19/rkat-mcp-0.7.19-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ff8d04276e331fd40a0f6b436427eec080c7b0a42ef764479702166b5fd649ea"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.19/rkat-0.7.19-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f5f48d0ba4ab9e15db8d21e2ff766cb41b2490a13f417a0be339f9b424c70c06"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.19/rkat-rpc-0.7.19-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0f2148533236650cb625e232141b92e69e6926176e91e30e46de3a961d7774d8"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.19/rkat-rest-0.7.19-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "75ea5574a3a28fa6ab2e78a5273d3734b9da2862cf7627940473f372998d7296"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.19/rkat-mcp-0.7.19-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e9ce7484264a782697933132119e5c00644577f06cc7caf832dd330b7939f89e"
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
