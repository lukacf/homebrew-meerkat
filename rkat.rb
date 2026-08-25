class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.29"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.29/rkat-0.8.29-aarch64-apple-darwin.tar.gz"
    sha256 "de301d7bc1fa5676443acfbf7f8efcb2e7c6bea82b2edb0a67642d00ef9af569"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.29/rkat-rpc-0.8.29-aarch64-apple-darwin.tar.gz"
    sha256 "daaed3a0e6f921582d2231091b774ba8764ade5e0afc64410004e9c48e7f5d87"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.29/rkat-rest-0.8.29-aarch64-apple-darwin.tar.gz"
    sha256 "8f1cbdc26be2147809812122a284ff76de2ece27c05166e683a359679f5fe069"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.29/rkat-mcp-0.8.29-aarch64-apple-darwin.tar.gz"
    sha256 "38f5f99c30ecb9c541e7637a981623b516dcc782a789e04c0a7de1e442362968"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.29/rkat-0.8.29-x86_64-apple-darwin.tar.gz"
    sha256 "c9fc725a1d3e83ff77653a83726da52b7c469ce020caaadeffea532b687957b6"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.29/rkat-rpc-0.8.29-x86_64-apple-darwin.tar.gz"
    sha256 "c17379c3955100c4c1916136bdf0ea31f17538ddcf64ff367dfce55dabd04073"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.29/rkat-rest-0.8.29-x86_64-apple-darwin.tar.gz"
    sha256 "27b501fd699e96b7dd7b21af75c55323c62e86c5a5f6b099f90d5c3042bb72a6"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.29/rkat-mcp-0.8.29-x86_64-apple-darwin.tar.gz"
    sha256 "47e56e78f312e49adfbcaccdb972a167cee0a07f6e7cb2e4a221178817ed79d7"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.29/rkat-0.8.29-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "344f191f7e03a7bbb11c45d39c2250ee56d15999f6f224f6aafd0cca982bd576"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.29/rkat-rpc-0.8.29-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a4ec409c8171f1104713edccceb4ea91d05c5e8e60f4f137f5a1635b146ec535"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.29/rkat-rest-0.8.29-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "25ad6dd6a841488d59dc91f6b677eebbf4f31047d4f228fdb6568342c3c57ea6"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.29/rkat-mcp-0.8.29-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "009f6a64c61fc75fd758ec1b49f81dded7f28024fe93f117664eb14488d31cb4"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.29/rkat-0.8.29-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "dac498bdff6ba187b1b56e9e819fca0a2d96b9aa6338335b8ef6990e18550a36"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.29/rkat-rpc-0.8.29-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a444d6cdebd0e97146d56d88cddc318e4fe259277d85141d55201f392e4ea730"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.29/rkat-rest-0.8.29-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "694d54358ff7361aa83895eda0b549e0606ef3feae945dbd17631096c78ca4e6"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.29/rkat-mcp-0.8.29-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "84e4f9c1d8aa7bf55cc67022dcf48e1bee76bd5c6791af8b26ad5f3a469401cb"
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
