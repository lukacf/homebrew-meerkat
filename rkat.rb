class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.7.12"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-0.7.12-aarch64-apple-darwin.tar.gz"
    sha256 "ad87d313e369069b584059f65faec0d07aed6e4b61defa49fb8d0871838b62fb"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-rpc-0.7.12-aarch64-apple-darwin.tar.gz"
    sha256 "a32f8d50371e7217ab71011700ef43b0fdadafd1e1898ef25ce083139cbc94a8"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-rest-0.7.12-aarch64-apple-darwin.tar.gz"
    sha256 "92ca0efc72748d0a675de50f9e6253e916cd23f8547917da932705daad6a529f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-mcp-0.7.12-aarch64-apple-darwin.tar.gz"
    sha256 "e038798652aace118fe7c3d94ef7515984b5405ab10a1bc328539b08b841ad8a"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-0.7.12-x86_64-apple-darwin.tar.gz"
    sha256 "88bffa304f6930df5a38d63cec1d68b8ec601c33a55ff02d69b6e313ae61bf44"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-rpc-0.7.12-x86_64-apple-darwin.tar.gz"
    sha256 "f3575884c7030c8cd6cf1e1fe4619a6edd0eb9283a89243ebf10b9398722b36d"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-rest-0.7.12-x86_64-apple-darwin.tar.gz"
    sha256 "fcf8bc8b8f4fdb149e7336aa74ea6dcfe27c508874782752929edda2d01cf6f6"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-mcp-0.7.12-x86_64-apple-darwin.tar.gz"
    sha256 "3d1a7e2bf58f3a1b4a0277d2224f8d07423ac2e18db372982832e9538d788584"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-0.7.12-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "75a38d8e99c163b35c008b64eae74c9e82400242793a4d882bee647948bacf75"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-rpc-0.7.12-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b41882ba9e6f80f43eaa9b3c52529f844bf697be8bf4c85057341cd4057060f9"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-rest-0.7.12-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8ce9f0a7d8d198029623e411235099892ae95fe07b27e518fd8c5198c3f5c0ae"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-mcp-0.7.12-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5e21c44258ffcc077684abef477e3c4106ab1a70a9ed70e4f282da487460c5d9"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-0.7.12-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1afd4971253b779e733d6a2e452f8df57180a5b1a3724038dce9c9d675fbe176"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-rpc-0.7.12-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4581bce28d5557ae5030a802fcd61b43b68e5e8dbec34cc33308834382a38a8a"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-rest-0.7.12-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e4a708d7406eb4c7c4c5b1c5cba7f31af6a5cf198fcc871957bf4b1cca504117"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-mcp-0.7.12-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1042fe7dbfd54217bed52cdf53c48d362e8eda61b2a4fbbccdf92c89abb11794"
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
