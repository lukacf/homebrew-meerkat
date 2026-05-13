class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.7"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.7/rkat-0.6.7-aarch64-apple-darwin.tar.gz"
    sha256 "3f8103c81b26562900c22be6c5476ee205744870c1c96b28df477be2a388ba61"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.7/rkat-rpc-0.6.7-aarch64-apple-darwin.tar.gz"
    sha256 "747080515d1df46931c2452e4ad03a21ff2fabe1966dd6e519c0e76922b8777f"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.7/rkat-rest-0.6.7-aarch64-apple-darwin.tar.gz"
    sha256 "3eae8f75865218d906f342eb2ac75c2b06dd0cfa698880fd40b5032e67098820"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.7/rkat-mcp-0.6.7-aarch64-apple-darwin.tar.gz"
    sha256 "2be805b2e0915e34f34fc6be146690e894386be19733d25e4451adfc44cf7a3c"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.7/rkat-0.6.7-x86_64-apple-darwin.tar.gz"
    sha256 "a147de01066c6f4c895cdc026a22399ebd8370611fde8ffcc859dd7346f8b8bc"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.7/rkat-rpc-0.6.7-x86_64-apple-darwin.tar.gz"
    sha256 "50bb7a585f5610f8f516353c754ba89499b729717b8bbba999b62bdf106580bd"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.7/rkat-rest-0.6.7-x86_64-apple-darwin.tar.gz"
    sha256 "2e9c1d697c8061027ec8fc2ec96cc9b7856905f222f535d752e5600ae3b465b3"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.7/rkat-mcp-0.6.7-x86_64-apple-darwin.tar.gz"
    sha256 "404313d09e41516f67e02109b4ab4f28cd23fa88224f8b623e1beb90c95c979f"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.7/rkat-0.6.7-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "eb40d96c8b4b3b6b521eb6f821d64f58dfbcbd66f1f8e9b65ed15a1d322b0696"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.7/rkat-rpc-0.6.7-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c836843f52b59404c25fa691f7b54a6d7413464baa4f1f988a14f3fa532b0469"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.7/rkat-rest-0.6.7-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2f896da24b33ba553a957377812e70d7742e859823f8813747b9ea57a8f5bd74"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.7/rkat-mcp-0.6.7-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "599818e201951045ee1284f79595ff2f84dd04e9782532932d8b0d9133ba4b08"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.7/rkat-0.6.7-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5a61b1e586ef7a5803b1d08008d33be71397f5a4360c91e2583297fc46cbf0e3"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.7/rkat-rpc-0.6.7-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7d0f250ad18a62d43d837382ac222292d534074b3eb54b5ab5672bab330bd19e"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.7/rkat-rest-0.6.7-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7f43c6daffb2482532b8778f9cdd292871672069ba00737c1202864faee59713"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.7/rkat-mcp-0.6.7-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0aa18d79e4836ed5cc6a974f1ba131495dd3926dd52c0a267b9398018872e0ab"
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
