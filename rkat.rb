class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.7.12"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-0.7.12-aarch64-apple-darwin.tar.gz"
    sha256 "056e8934a7c39f7b2db2ccc65900588687483f778693440c1e8972d5ffec77f9"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-rpc-0.7.12-aarch64-apple-darwin.tar.gz"
    sha256 "7efe0d5e8cc7faabd3b2ea281b1398648e23f47a5a32fb4c95e799c8ab1c68f3"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-rest-0.7.12-aarch64-apple-darwin.tar.gz"
    sha256 "2f80d5be4d01f76a4181cee7e9269da170b53142d67fda1f22282fdcf9970921"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-mcp-0.7.12-aarch64-apple-darwin.tar.gz"
    sha256 "27558ebb0e7a459213234f76004a9574c86902b2d54e99b8512539accb79d98d"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-0.7.12-x86_64-apple-darwin.tar.gz"
    sha256 "f4430e31898c558f10accf45caee1334e74c0aace9fc86202e60af0ca0d3410c"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-rpc-0.7.12-x86_64-apple-darwin.tar.gz"
    sha256 "f83ab9b959f6e61b7689eb869e1c1a1ee936a035d32f6aca00dcde205ceaad95"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-rest-0.7.12-x86_64-apple-darwin.tar.gz"
    sha256 "edd14c614c707126bbec8fd9074fdb0659b3683bc199068be25a239e87d7c1c5"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-mcp-0.7.12-x86_64-apple-darwin.tar.gz"
    sha256 "89d89bc42d10be9b56b311b09dde5333a307196f3d5b1ccc7a08ca48c8640b76"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-0.7.12-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "90950e3cc167194012977c5681a081e89c4dfdc394b3a0f8928b996d954ded26"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-rpc-0.7.12-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f2fb9098043ec27904a065f62621e956f59d26a23dbf7b5a9634237b65258378"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-rest-0.7.12-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c7bd980ff719d02b971144a78a993b8ee4c897a829dc9387bfbf88baa70297d0"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-mcp-0.7.12-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ad22fca68d08561904ab20616a9af209d5efa36adbb0a0fab89732b3f466291d"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-0.7.12-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f4ab1d6a937f4150a07d24401bcde90ce6e774bf713fcbaf27d3d1f1b5060331"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-rpc-0.7.12-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9e0d5ed133d5c0f807732de59cd6e3c267ceeb6d564626285dcf55359f8f88b8"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-rest-0.7.12-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "14511d66c12fcf0295e9d8e24b5171841d0339e7e2cd097b3fb5569c40353537"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.12/rkat-mcp-0.7.12-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b614060135c7896de5700d3e8c84ba87d52d59122f21ece6a5dce038b642497c"
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
