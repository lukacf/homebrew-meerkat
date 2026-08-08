class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.21"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.21/rkat-0.8.21-aarch64-apple-darwin.tar.gz"
    sha256 "806153ed3ea383fdc5db169a38abc3f2f0aea83b8820daa301253885fb726a60"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.21/rkat-rpc-0.8.21-aarch64-apple-darwin.tar.gz"
    sha256 "32b4807f10fc662563cc541df1720a526e79f010455bfca35476691986cf4aa8"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.21/rkat-rest-0.8.21-aarch64-apple-darwin.tar.gz"
    sha256 "d0144badadf37f9d5a5ee94ecde69fdc4b2b9b35e0227711a9bb78ccaa3b8cc2"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.21/rkat-mcp-0.8.21-aarch64-apple-darwin.tar.gz"
    sha256 "f7036c9cf62084ac23cd9ca9c5eb055749a469947e1d8d6919450f9221a55d74"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.21/rkat-0.8.21-x86_64-apple-darwin.tar.gz"
    sha256 "bea0c6d3079845ae8b75a37dc1f45b31c4c0e6febf461ad89c997770331a97fb"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.21/rkat-rpc-0.8.21-x86_64-apple-darwin.tar.gz"
    sha256 "a029b162de87eca106d3817cbfa26a8389e999cc7740191e821e7fa2e0a225b6"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.21/rkat-rest-0.8.21-x86_64-apple-darwin.tar.gz"
    sha256 "1a30e937166d4490e98d9ce326787209b6efa157bdae88c45d737bb6f21eef14"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.21/rkat-mcp-0.8.21-x86_64-apple-darwin.tar.gz"
    sha256 "6b5148f6195deb3651033bd51781827b1f4839530eb533cb68d191ebbfc73544"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.21/rkat-0.8.21-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ca513425b66350fd1c65483fb8b332ff069bdf5b75bd74a0fb0bffb1e643315d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.21/rkat-rpc-0.8.21-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "57924f725b14b8de471d19a0374708dc739455e83285a39ef2fc404c20a55e85"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.21/rkat-rest-0.8.21-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c144d939d10d850883858fbad6197024c16f325e10c993afc0e5055c0d269f6d"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.21/rkat-mcp-0.8.21-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2214937c60a1c9f2a6cfc4b9df490cc4dbf4e008f5bd3ed98c7e598571ed0bc9"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.21/rkat-0.8.21-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "67d375790c9916f212269da9d941b26c6cce5bb4ffbe40ed628fb067f251dc3f"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.21/rkat-rpc-0.8.21-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "54144b1ab3f4548697eedf99eef047770af7aa331ee30005eb28dbe7e4a13068"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.21/rkat-rest-0.8.21-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "49d29bed46fa581c8ec25f1a3ccd71ed77986c2a835e1d2c3ee20d92894e5e54"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.21/rkat-mcp-0.8.21-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b09a642c1908e52e03af2541d3c12fe231f3d5b3952c636b0c1fb6c2c9acfe5c"
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
