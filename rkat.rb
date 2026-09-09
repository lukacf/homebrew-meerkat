class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.35"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.35/rkat-0.8.35-aarch64-apple-darwin.tar.gz"
    sha256 "08d2924ae8a1ed3a3702fd9b973cb47f5779c9fcf67537d1d8c87f65baf8248a"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.35/rkat-rpc-0.8.35-aarch64-apple-darwin.tar.gz"
    sha256 "bfdb269d8394155027d50e37bc12abbeeee40b6d1db44fa59a463890e5630969"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.35/rkat-rest-0.8.35-aarch64-apple-darwin.tar.gz"
    sha256 "f12866454cc6e9696b177a073a0b234b79f29050bf497543f1ca91a533218375"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.35/rkat-mcp-0.8.35-aarch64-apple-darwin.tar.gz"
    sha256 "f2ea7654b5bc9d4dfd1871edcbc2cf1b73585595ee60cd12e5031f3be89645c8"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.35/rkat-0.8.35-x86_64-apple-darwin.tar.gz"
    sha256 "f40780b9bd0d188bf38e2ed7b0581b809fa0ea50d8116a7096b24e52f14f09ad"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.35/rkat-rpc-0.8.35-x86_64-apple-darwin.tar.gz"
    sha256 "b5a6c4d81d80456a3b909a2e5f40ba506f5f3cb433bb5810bcfd6a6e79c1e04c"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.35/rkat-rest-0.8.35-x86_64-apple-darwin.tar.gz"
    sha256 "eb996c96dc699f133816ff4b8db10c39d454078801320fb49c2cad5834847b4b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.35/rkat-mcp-0.8.35-x86_64-apple-darwin.tar.gz"
    sha256 "61bbcd3e1ba3626ecb0f3e0bb7815e65ac6783fe86f1a575a69c640960527922"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.35/rkat-0.8.35-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4dc2d7eed0dd9d891dc4936cdd58c5878ec60e80c47f5f98da05d7b0d6182fc0"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.35/rkat-rpc-0.8.35-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "03f24e18ccdf9a1265fdcb091d380bc84ed8d99ded7e5f790b1fb0d00e97a7be"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.35/rkat-rest-0.8.35-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c3b4285c001039b91071e59cd684789581a310c25273fe2f8ecd340961471f2a"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.35/rkat-mcp-0.8.35-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5244308633493f15d73c8f45d467cd8b30253da708d4b6980ec5b0b96a63433a"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.35/rkat-0.8.35-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e55e582be46c3ae2ced3f68409de80934003c1ea8b3f2cd7ab11fdf44ba78feb"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.35/rkat-rpc-0.8.35-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2fc9303d930fb68d0da4af797ed34f73542563b8022f884f7a647ca384021633"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.35/rkat-rest-0.8.35-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "08e850dcecdd8a6e3475706bffe80df9a1cdcb8ac95238810f0b18ae74636040"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.35/rkat-mcp-0.8.35-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e30d905c46ccfd51c46df894595a69909e93a2cf3ee72fb3c6bd83b66755a033"
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
