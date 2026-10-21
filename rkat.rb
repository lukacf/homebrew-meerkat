class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.9.4"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.4/rkat-0.9.4-aarch64-apple-darwin.tar.gz"
    sha256 "fe2d99b33bf7c8feb74c07c7032643b15e6648567548fa0a1e2d67b8ac60806d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.4/rkat-rpc-0.9.4-aarch64-apple-darwin.tar.gz"
    sha256 "97916114d1f3d39fa1191a1042ff9ea380a70bf499bc5ae3549375adedc27063"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.4/rkat-rest-0.9.4-aarch64-apple-darwin.tar.gz"
    sha256 "b3cf02226ffd826b53d2a739a8393b11bb23b50375453ef6f99319231bb735e7"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.4/rkat-mcp-0.9.4-aarch64-apple-darwin.tar.gz"
    sha256 "e0aac63b3f87697faf60311338d4ff5b99f7fedf87d07f981f594239c278e42f"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.4/rkat-0.9.4-x86_64-apple-darwin.tar.gz"
    sha256 "d867b720f44c27ae8fca43eb47ee9262e202ffb9bab8a2aae6138cfab94735f1"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.4/rkat-rpc-0.9.4-x86_64-apple-darwin.tar.gz"
    sha256 "73919be2248466b2fd0ecef75acf46f2ce8b7930bceed536cdc7a974423ef963"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.4/rkat-rest-0.9.4-x86_64-apple-darwin.tar.gz"
    sha256 "ee0cbc0d854b76a5d2159a2c70a195004bcca95d74fc4838670eb91e78e72bd8"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.4/rkat-mcp-0.9.4-x86_64-apple-darwin.tar.gz"
    sha256 "4275ea628ee35016dafc2e4bd0789ad0a93ce80d2c050cf40ea52356cdcfbe69"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.4/rkat-0.9.4-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8825b3b21bfb4bd95eb326e896fb9638c5ffa0a5ff3a200aa9f8532615f44e76"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.4/rkat-rpc-0.9.4-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e21c3879d194eb907b082a35aff7827402a3b8baf8e93aef6b03b9b96ebf0b6d"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.4/rkat-rest-0.9.4-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c65887f9d97ea2744d4cb56bab3bf69a8a8c7b1560ec2cd788aad299de3a3cc8"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.4/rkat-mcp-0.9.4-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "dd051b404130c067282411c841cbbb6a00460c1e92b03c1abcb8e1a45554bf55"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.4/rkat-0.9.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "dfa812a2f5bcfa2223ac5e53e0c9eafbc1da72e96a27024002911a558b3f51b3"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.4/rkat-rpc-0.9.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "00253ea4dd30ff0ca34fb0d57c5e659a43a1d420ab2e0361e876474908e3a188"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.4/rkat-rest-0.9.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "066dd1760e1de5d11563f71b884330dbc7f33c22446a604319aa82813b78962a"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.4/rkat-mcp-0.9.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "160430d913ca6425a70c40c3690dc7f5a30a0a2bf36b8c9e829e8cb268ed9a5b"
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
