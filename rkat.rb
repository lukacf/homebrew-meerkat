class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.9.12"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.12/rkat-0.9.12-aarch64-apple-darwin.tar.gz"
    sha256 "7d18c6217d03df6eef918448937112d1fa2f902a243470ffd35d68e69f8b794f"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.12/rkat-rpc-0.9.12-aarch64-apple-darwin.tar.gz"
    sha256 "953ebfeb8e93825389ba579322d0227b073e081812f5463e5a6615b185114570"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.12/rkat-rest-0.9.12-aarch64-apple-darwin.tar.gz"
    sha256 "5cd0ab472ed4bfcab576d1e32191ef4c3f4bebd7346047512666fb845516a14b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.12/rkat-mcp-0.9.12-aarch64-apple-darwin.tar.gz"
    sha256 "f967ba8bc59e93573b257d06508df86249f717884a169a29274839147ed79a8f"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.12/rkat-0.9.12-x86_64-apple-darwin.tar.gz"
    sha256 "8ae51249f74026ed7c732edb409fa52f85174afff2ecd87785a6b5c7858f0aae"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.12/rkat-rpc-0.9.12-x86_64-apple-darwin.tar.gz"
    sha256 "771e302138468a22d482e521b38fb555ef9b1bd2ce9047c35123fc06497a2f34"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.12/rkat-rest-0.9.12-x86_64-apple-darwin.tar.gz"
    sha256 "27449914ad02e7f86d6b6502c223778b616bd30c61a0f9ac85cae642f5eaa3fa"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.12/rkat-mcp-0.9.12-x86_64-apple-darwin.tar.gz"
    sha256 "71c617ee5c921b25bcbc1de8473b913bdb60e9e43346e1009a70bc11e3999e85"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.12/rkat-0.9.12-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "73a014279cbf0746e53e1ead17384d7d904a807f9fbf915de8c586b379fde877"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.12/rkat-rpc-0.9.12-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b8889aee8b92e8972f083b555d735b9b8bd35408d8d4adce549209d9f7ce1af7"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.12/rkat-rest-0.9.12-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4337608247f9f229cdae34cbaaaff105d22a1f8703c50804c693db7d1e1bad4e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.12/rkat-mcp-0.9.12-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b0c71f9c966cd8f000d196fb6d09d0e6ff2b028e3929fdfee09367aeb3b87a93"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.12/rkat-0.9.12-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8a8ed8886149d56d81aaacd9ae2800b4fcdcf2c4340133823be2e7fcd3537c69"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.12/rkat-rpc-0.9.12-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "39bd2048b3ecb183d476ee3ffab2e5263e820ffcdf66636eb5a44f4e5cfc5feb"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.12/rkat-rest-0.9.12-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3bcd18beebc7a8c954b59e5f1b2ec1420e903456ac1928693a33f1297747d0e2"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.12/rkat-mcp-0.9.12-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "10f06580b8ef4fc11e302ee8149a77f99a28a4ba4f8b1d03c5b8784a5c3606fd"
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
