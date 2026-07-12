class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.7.29"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.29/rkat-0.7.29-aarch64-apple-darwin.tar.gz"
    sha256 "21f3caa300ff721803a4d82224a67e28dc6e4ad3f4bc5265089f869a98f58979"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.29/rkat-rpc-0.7.29-aarch64-apple-darwin.tar.gz"
    sha256 "114b74b6d79d66d532cd81f1da198a513d721760e3c46c1c5c41442d1490381e"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.29/rkat-rest-0.7.29-aarch64-apple-darwin.tar.gz"
    sha256 "24175f55068d553b6820bb7cf97553c0af308bca64754fd7a0caf0ad6cf3bf13"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.29/rkat-mcp-0.7.29-aarch64-apple-darwin.tar.gz"
    sha256 "a894c01cc104c217279564253ecf1136a27639d442672f84299a97def9a74ff6"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.29/rkat-0.7.29-x86_64-apple-darwin.tar.gz"
    sha256 "87ea186d8df274beda25b0de81f59000d7c0b4162d41f6abf81cde4f797978dd"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.29/rkat-rpc-0.7.29-x86_64-apple-darwin.tar.gz"
    sha256 "d1007ac72b3e6996a15df2d81372d036ec5303f839653d77c3a1fe696d15fc52"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.29/rkat-rest-0.7.29-x86_64-apple-darwin.tar.gz"
    sha256 "5e6faa6838518c0fdd70f18e8f6e2da0af1298c9dd90c6a9481215080c4d5478"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.29/rkat-mcp-0.7.29-x86_64-apple-darwin.tar.gz"
    sha256 "ea4d98909ae9d48e4da2dcc1b43462c96c6afd51f8b34264d7ccf82d7ed5325d"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.29/rkat-0.7.29-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2e0a6cdaf4d9573d35cf7592d6d1ecb2a06c74dc1f247c833db5c8e7f5013cb0"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.29/rkat-rpc-0.7.29-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4bea823a69c63225abf6fd23e0ae3bb9eed1304aad5bd17be823cbd487869b2d"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.29/rkat-rest-0.7.29-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "498540dc6e7dea94be0aa5934b0c9e8be9978c5465093ecb5d28ac8d5d867ce9"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.29/rkat-mcp-0.7.29-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "62486906805bb60089731410f832b7400eb1e348eb6a553ab8c34651dfff1af9"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.29/rkat-0.7.29-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4112d4a7b276c9f33a01384018d2a3cd9f2e0e9087bfdbc372103ecd6db21d4a"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.29/rkat-rpc-0.7.29-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6fba11eb1032cbb39e241de1a04ad28072999ba0ea8ff6ddddd3fe35034ffaa8"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.29/rkat-rest-0.7.29-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "557119af4378cc0a6be5096f3c92c6a1ae2952f5e980315235ce2234677c6caa"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.29/rkat-mcp-0.7.29-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bd61c9b27380f54206c9f36d115eb70d7ba5347af0e8fd1564566d7a48ae419a"
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
