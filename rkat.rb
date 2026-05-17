class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.14"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.14/rkat-0.6.14-aarch64-apple-darwin.tar.gz"
    sha256 "aba67fad9931c5de9b308714a4c72f4038f4c0892548be8951029ff7f6626c36"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.14/rkat-rpc-0.6.14-aarch64-apple-darwin.tar.gz"
    sha256 "ce43d7d819928cfc8088d921e5c076635576a80d1785c1c718d1cdfae38f6681"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.14/rkat-rest-0.6.14-aarch64-apple-darwin.tar.gz"
    sha256 "6efcb308ab4af8cd77928d1e0b349d5be2ab8e162ec1a045b28db0df4f5d04af"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.14/rkat-mcp-0.6.14-aarch64-apple-darwin.tar.gz"
    sha256 "2e49b2a0fe061299e962d081d1305b895bfe641accaa68d39aa0442cf06fc5ee"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.14/rkat-0.6.14-x86_64-apple-darwin.tar.gz"
    sha256 "861b497b88dbb4ec2585885e6eada6695945fafc31264c29422f3bcc047c0bca"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.14/rkat-rpc-0.6.14-x86_64-apple-darwin.tar.gz"
    sha256 "5ee7eb64fd1a90f3037ab45f9b1623d1b146b49b302b8bd13f538e7210f5f797"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.14/rkat-rest-0.6.14-x86_64-apple-darwin.tar.gz"
    sha256 "0575acfc175e3f77e2c02dda57532717ba0bee067025f17bdea9526f2c7c03c4"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.14/rkat-mcp-0.6.14-x86_64-apple-darwin.tar.gz"
    sha256 "3a7018453fbd76a94bf2136b5508f51d5501ce2bbfa8850835f2d2888797d2ff"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.14/rkat-0.6.14-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e647c5ce65c557c980f15ead9c2283031278b95c8611783c706615845a08417f"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.14/rkat-rpc-0.6.14-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3d99013adb58ff0be68ec5b1e3b3fea5a5f9b68014b0ab733d214d57d455d667"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.14/rkat-rest-0.6.14-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b41b583235cf41505b5f5ccb8a30a15e8d1caf39fe61b0338da7da8bb4cb840f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.14/rkat-mcp-0.6.14-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2c250514d0dddaef4f98d3a9629355b98afaf0895ceb38ee4b4a3a80202dd2b3"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.14/rkat-0.6.14-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "42bcaf570f6d76d7b4581056a2c552ee3e8e0209be96396d65de1912e7d7ea46"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.14/rkat-rpc-0.6.14-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ffaf3e6a06efa9f53d640b0978961d859b5022b9204248a09122fab46147be58"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.14/rkat-rest-0.6.14-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e7128aed7386fce32b5685e02d54dd6036293714def6ff3bbe3a287a50907e4f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.14/rkat-mcp-0.6.14-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d14a2bdfdcf7f1429d539e7da05843d9ecd3767cf6f0be120be4e3e5e3fe7117"
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
