class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.15"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-0.6.15-aarch64-apple-darwin.tar.gz"
    sha256 "ccf8be456ac4d00870aac900a97927105252ac75101392208fcb0ff902ae0587"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-rpc-0.6.15-aarch64-apple-darwin.tar.gz"
    sha256 "1c97754640afc9dfacc0523e8f51b9699029060e3c71f9060c247994f8b6498d"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-rest-0.6.15-aarch64-apple-darwin.tar.gz"
    sha256 "0461520cb9867b1445335e541de730f24f78fa9ebf66da9505d5a2ca42c355d7"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-mcp-0.6.15-aarch64-apple-darwin.tar.gz"
    sha256 "d954142e9a2387e1c31c341a05ab1ab5eb416f4f3abb851e9d867ecc35e07b4e"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-0.6.15-x86_64-apple-darwin.tar.gz"
    sha256 "5b74a4d002edc59a95bc2836ea22df86030e2e53527ea5abb9bbfbc3d136698a"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-rpc-0.6.15-x86_64-apple-darwin.tar.gz"
    sha256 "884add010bc2aa8f1a32fd4dee5241253b6e85b7540cab09b0bcc93024dd1e2f"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-rest-0.6.15-x86_64-apple-darwin.tar.gz"
    sha256 "02bccd4e6c3775d3d6c9d99f96f176eb32160e244ab92622a119a02ce6a6b526"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-mcp-0.6.15-x86_64-apple-darwin.tar.gz"
    sha256 "8382e4a9cd1758c699285e0c8f9c243c43692885e33cd90c9b7ffbce2a2a74b1"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-0.6.15-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "50b03036f36b006af057aa6a665c1202afe5af5be696c6cc7521c170224dbc67"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-rpc-0.6.15-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "50601d2f939285d40c1b1e8f300411547112c5c859c93c2acd7c866b5efaa6b2"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-rest-0.6.15-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d00a28fe90336eccc2d87ad74426e671c6375c3931105d50ba49e24e53d5f17b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-mcp-0.6.15-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "94f09444d3e45ef540a2a0e8ce936b32675f747c0495bfd553e1163e8767f726"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-0.6.15-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d51002e4b020353b1dacc612b31afc655f1e2e03eab42f79cd959cfaf7402859"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-rpc-0.6.15-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "958df5ea613a6ae232184bb14a2c43dca30af100c40403b9db6148f092b816ab"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-rest-0.6.15-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0963bc822a905f26d445b6e704728c816d2c6f984fb63a0890417f44adee4c1e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.15/rkat-mcp-0.6.15-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7ce18984905cd4d45bff387df375701c72d23e4223803296848c07d0fe5cd1da"
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
