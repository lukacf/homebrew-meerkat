class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.7.21"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.21/rkat-0.7.21-aarch64-apple-darwin.tar.gz"
    sha256 "755cf5fc2adec8c27c71c4ade72806695d1958e4679d80512b7d02b80c487050"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.21/rkat-rpc-0.7.21-aarch64-apple-darwin.tar.gz"
    sha256 "5a0b46c8f4b80445b8686b08023f03baeb27c3c067a00083eb65af297b3fc227"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.21/rkat-rest-0.7.21-aarch64-apple-darwin.tar.gz"
    sha256 "2c15642120d271c1829f1142df599c433920fccb89c03e34ceb90040344ec361"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.21/rkat-mcp-0.7.21-aarch64-apple-darwin.tar.gz"
    sha256 "48beb04db1caf9d182df7aad3b7312c1d373650177945c06af8624f99c33afc4"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.21/rkat-0.7.21-x86_64-apple-darwin.tar.gz"
    sha256 "47a60039b8ea3331455d4f0a69f48d58a8cb7cd0036be9d9641ebe1ab90bd2ba"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.21/rkat-rpc-0.7.21-x86_64-apple-darwin.tar.gz"
    sha256 "b65688f82df80000195ade5e61ebab678e517ed3966173d383b88c5d61ed7347"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.21/rkat-rest-0.7.21-x86_64-apple-darwin.tar.gz"
    sha256 "8f3bc0fd5e13053fc81f6cb85698492e6fc2d99862b348cc50d7c3966bce567e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.21/rkat-mcp-0.7.21-x86_64-apple-darwin.tar.gz"
    sha256 "1c067dc7d7dedce4edc85eba370168d21f7fba7ae7b18e6c9a505fe297e2eeab"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.21/rkat-0.7.21-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7e671f3eda170f19ecb2a8b69a4dae9fb132f9351a148566286b08ed7b97c57e"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.21/rkat-rpc-0.7.21-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f7e8876d0128303dbbc6e2b59b1f0413fc76b578dfe9991e0f54374f40dd01d3"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.21/rkat-rest-0.7.21-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3e9820b99871e0f39364ac8edcf0bc5ebc7f52dfd4a6f4c983fafa8eb90bc273"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.21/rkat-mcp-0.7.21-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "41693b2a9db347250b6029eac4a0e1d76a6dc95408af211d9765bdba4392e02e"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.21/rkat-0.7.21-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "32bf332d962666ab16bf15e78525ad472b58d1f9fd14c0ac76009564143b4a6d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.21/rkat-rpc-0.7.21-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "00a1e979b9eb9549edfeae7a669b86d58ebaa539ab676e3482fc2b4c548226eb"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.21/rkat-rest-0.7.21-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "740149f886b36e5170f70f9d6be96fab6e2fd4ced635aefee97b1e2a8be4a712"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.21/rkat-mcp-0.7.21-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3084416286f7e9b3639df7113930a8666cd2e11d2d974d783f13d8c155c36da3"
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
