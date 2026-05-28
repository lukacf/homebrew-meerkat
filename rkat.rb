class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.27"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.27/rkat-0.6.27-aarch64-apple-darwin.tar.gz"
    sha256 "19bf00b7f9ec1b2d9d825168547a73eaba4d394bd6bf0b9760163e753338fd4f"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.27/rkat-rpc-0.6.27-aarch64-apple-darwin.tar.gz"
    sha256 "0c5e4e83ada565904cb586f72bf4ce6e9d5d03afb085217760627ee44cc1bbd7"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.27/rkat-rest-0.6.27-aarch64-apple-darwin.tar.gz"
    sha256 "2034c5c589a8f65187845819de84f37f174b71af98eb54bf4d2c13ca37dbe30b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.27/rkat-mcp-0.6.27-aarch64-apple-darwin.tar.gz"
    sha256 "99ab2bc9346dccb27a9f716c09f9cd11ef6aaf7726f8947ade358d04b9d347f2"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.27/rkat-0.6.27-x86_64-apple-darwin.tar.gz"
    sha256 "ce103096d4a3e9d449193de4df9c7ae10300d44e91158d0ccc1896f352e73365"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.27/rkat-rpc-0.6.27-x86_64-apple-darwin.tar.gz"
    sha256 "ec78aa6da2d41fb860a17bbed13edc9b11b3c2d2811acc830b396b2214175ba0"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.27/rkat-rest-0.6.27-x86_64-apple-darwin.tar.gz"
    sha256 "abca29510163fbc8c498319a5929e28994a5e313d3cfd6564e88e1f8a41293be"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.27/rkat-mcp-0.6.27-x86_64-apple-darwin.tar.gz"
    sha256 "61edc32eebaf88e2ba932dc3570436aea4287e4fad823bc846e94dfacd4747d4"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.27/rkat-0.6.27-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "99ba9e0392578c49d4d608e7b5f038a807b9cb670d1512d64bf5834bb3c03905"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.27/rkat-rpc-0.6.27-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "147386ac7119096555e5c63469203341d3e8541cef2527a13c167e4d536088a7"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.27/rkat-rest-0.6.27-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9c371ab8b3fc7a2a5ff287c23244cd213167a602c930b9412b29c3b6a9f85cc9"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.27/rkat-mcp-0.6.27-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d07f3c7e7a6fafaf1c5a6aae2732fc00ce7bf0c9348927a8ff347d20c50aad60"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.27/rkat-0.6.27-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "17cf97146c79b09539a70bdde7ba1a6e287d4e0a763da37aff2c6fafeb28b113"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.27/rkat-rpc-0.6.27-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "03aa696b09d59783c4c9c7b8b6dce6e49a64b5f587e7307c8b7b09bf73036abd"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.27/rkat-rest-0.6.27-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2574aed372f65a399009f8f707d6884c67ee68c0bcbb5d2a8036a17ff41e3118"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.27/rkat-mcp-0.6.27-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1ebbb6f34f51dec11fb49d4d8b6a6660e78ca56fff34e14ffb0c69fb611d7965"
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
