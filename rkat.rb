class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.7.3"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.3/rkat-0.7.3-aarch64-apple-darwin.tar.gz"
    sha256 "6e536ddcd40610f1e6a39a1c5d8405ebca9d31c9a7f6a45ad5f116c5d7366030"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.3/rkat-rpc-0.7.3-aarch64-apple-darwin.tar.gz"
    sha256 "157087eca0b354a014af4328cf66fed21a04d6cf513e341ae1bc14d0771d453e"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.3/rkat-rest-0.7.3-aarch64-apple-darwin.tar.gz"
    sha256 "8c27eb6d4247034cd4d7a19028e754881011b4ac18ff6f760d66aa4c3e35096e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.3/rkat-mcp-0.7.3-aarch64-apple-darwin.tar.gz"
    sha256 "b787cfb35a246778bfcb8c8857e4c9467415ae804ef4a554e97b07df95e8338e"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.3/rkat-0.7.3-x86_64-apple-darwin.tar.gz"
    sha256 "fb698e105d58b3f920a2aaa2b80666dd2a93fba3516e1df20a66354d0b35c9c7"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.3/rkat-rpc-0.7.3-x86_64-apple-darwin.tar.gz"
    sha256 "0b0fd18a27738e6f0d66d1808884dc46fb4ff2562602f37fefa9ae45f5ccccf9"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.3/rkat-rest-0.7.3-x86_64-apple-darwin.tar.gz"
    sha256 "844131cad2c3df12d213d6a2a82ce811d79dba679cc03d320f13a7c29896af85"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.3/rkat-mcp-0.7.3-x86_64-apple-darwin.tar.gz"
    sha256 "f3d1b88ead64b946e92f7dd400a1133c77f09e50256d56c888de84983b5502cb"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.3/rkat-0.7.3-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9776ecaaa8925e768f62593826a1b6cb24d98cd4da9c7efa136005deb80103e2"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.3/rkat-rpc-0.7.3-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7a1a252a02291284191744902ebc6f21661fe02d42f4ffc1ab08dafd2f5ff6ef"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.3/rkat-rest-0.7.3-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "25f35f577d8388433058a64f5f6ea2192400da78c6c1390030b9264844e09a47"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.3/rkat-mcp-0.7.3-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0b9f45c64073e97ba29ddc861e530e29b665eabb6028a17c85216c84168334f6"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.3/rkat-0.7.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fa5345982f9081a349f7b9e67bef25d73167fa65955be434d7c7ce3a9d6f3894"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.3/rkat-rpc-0.7.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "625441a6a2aed914e0e925c319f7021d7c6df93f55311009afc6411ddd42765a"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.3/rkat-rest-0.7.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "67a8efb63f2bdadc58ffd184a02dfe0c1c487906ca29760f48074e49dee610f1"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.3/rkat-mcp-0.7.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a65245ed3d678f88d10c6cc1202f00fb21d418fb7db47c9d290532f3416333c8"
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
