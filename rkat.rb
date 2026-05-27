class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.26"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.26/rkat-0.6.26-aarch64-apple-darwin.tar.gz"
    sha256 "487db81a322d926d563eb66c3cce3dfdf012718d6c7f450b135ee72e95583230"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.26/rkat-rpc-0.6.26-aarch64-apple-darwin.tar.gz"
    sha256 "8e29d6c25ab2b2d00c37675d5984abcccb5cf6af51cfb2ca12cf2820b39250cf"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.26/rkat-rest-0.6.26-aarch64-apple-darwin.tar.gz"
    sha256 "8fea4c3f9a917b2cd6bc79ab9af176fe69f680898f7b64068cab43e8f2df981d"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.26/rkat-mcp-0.6.26-aarch64-apple-darwin.tar.gz"
    sha256 "2cc78c19730a1d09a97992369d5365d38f4fb8b9cf4d2b0e6b721a6c0c298bc2"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.26/rkat-0.6.26-x86_64-apple-darwin.tar.gz"
    sha256 "4794f9ed3cfb967579251e7915c17b5e1e938b364a784d0fd6d13f16c644a7c1"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.26/rkat-rpc-0.6.26-x86_64-apple-darwin.tar.gz"
    sha256 "9645cc033949301c20937496e83d613fcdadf58c5d965e0d625016049acfdaaf"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.26/rkat-rest-0.6.26-x86_64-apple-darwin.tar.gz"
    sha256 "39f046d2de6cf5e39fd1d4c06c1c23b2f642d2e25fc0d52d0bcab779e3247a7b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.26/rkat-mcp-0.6.26-x86_64-apple-darwin.tar.gz"
    sha256 "44beef2d0df8e5b4d519054401ff6c10706db132c5a5f3f1c533b870d7c1c78d"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.26/rkat-0.6.26-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "424af6b3ce36f0e850c62abe36d9bde7b86afac1064f727650527471441bb447"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.26/rkat-rpc-0.6.26-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "863f980b7534228444a0e9cafa233065fddae32b01a50deabb0120040e59c334"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.26/rkat-rest-0.6.26-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3e8cad84d29275562d6559ec03fd307d512b86c60b48bcb89ed645970f5b03f4"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.26/rkat-mcp-0.6.26-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ff2e1dcdb2a60d1620c2af032b853ec71d770990c29d43d55658270fd2826f99"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.26/rkat-0.6.26-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e16f57324ee4503aa7b333778b948f29ccad3c7622e6d5b3324fbb16962210c3"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.26/rkat-rpc-0.6.26-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "beebf9e3b35720f89a0bb96881e8942b6b6c325c60cb289f1bd6cac0e167e4a3"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.26/rkat-rest-0.6.26-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "647e30f99589ee708e8f2c0bdbfb32f9dc8f43c5db68cdaf2a2ceb8d10e4ab37"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.26/rkat-mcp-0.6.26-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "316abacc47c09598cca2017c69708ad6c4fd3b6e68a96249d6665782760972c7"
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
