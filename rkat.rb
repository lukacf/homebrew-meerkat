class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.0/rkat-0.6.0-aarch64-apple-darwin.tar.gz"
    sha256 "cba2719104ae379a582192d918d20391af2dbb6fb1257f432c113aef000a4dd8"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.0/rkat-rpc-0.6.0-aarch64-apple-darwin.tar.gz"
    sha256 "cf333e67dca489ef1f3e21e04ed09959c5762fb24bcb12f1c88f7620c030b9bc"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.0/rkat-rest-0.6.0-aarch64-apple-darwin.tar.gz"
    sha256 "d6619ea90476d0c66ef31505cb5b7795bfe1bdb7590fc773a5f9bc883244816a"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.0/rkat-mcp-0.6.0-aarch64-apple-darwin.tar.gz"
    sha256 "73164ffa7a50c973bf65932ec6c3db67ef8e78a91c530c4ece42aaa0d269f3d3"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.0/rkat-0.6.0-x86_64-apple-darwin.tar.gz"
    sha256 "59c482ffa932996ebb6b8f5d359793955044fcec5424c6fbdb6b64da8303fcf9"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.0/rkat-rpc-0.6.0-x86_64-apple-darwin.tar.gz"
    sha256 "4d3acb99b809b34dface1a35dac3bc42bcf0c1755b805dfeb7a695e9f1d59f17"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.0/rkat-rest-0.6.0-x86_64-apple-darwin.tar.gz"
    sha256 "77feb50cd383d40411bc4bc3f98cd63bc8520eb9ae27cf97ee590221746d5b40"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.0/rkat-mcp-0.6.0-x86_64-apple-darwin.tar.gz"
    sha256 "178c0ed068867132cb8f4d7a4e638056933c52d3e67e4bd0b5825adade2aaccb"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.0/rkat-0.6.0-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "162feeb5686c7d12ae65a68a899769a32f60d5b30a6752dd3068778883dfaf98"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.0/rkat-rpc-0.6.0-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8cca5261f7846e41a57319a5ed6bd4030ea42c4d22324da18706bad3b682df53"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.0/rkat-rest-0.6.0-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6e1349f855fbf5a4171faebcbd3546a8108aa242708d1ee4a9d0acbe57b91c2b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.0/rkat-mcp-0.6.0-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6d524ea658c89ca8a3e4f6dc4358cc6691f8c6d0adf5fc0e6381c5e1df281901"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.0/rkat-0.6.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2c67bed9570fc3be449949559d360bd3d31b7b89cc4db3395993f8f1ac07dc60"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.0/rkat-rpc-0.6.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a6a370d608f8819b04d8b80dbefa3b0477fd1794663ec2933189e66c89d2149a"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.0/rkat-rest-0.6.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "61f99026e211dc0d7ec1681c330bd52f30aa47b313e8a0f1684a013cdf6a13b8"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.0/rkat-mcp-0.6.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "05fbbc545b9652e53f58129bea0b21e1b751a4fa286707a41cbceee18dd14870"
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
