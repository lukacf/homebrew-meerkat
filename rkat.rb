class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.9.1"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.1/rkat-0.9.1-aarch64-apple-darwin.tar.gz"
    sha256 "260a6d21703e2dcfe991ec069317abc91d52a5b7ea45405ef0988be46163b5d3"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.1/rkat-rpc-0.9.1-aarch64-apple-darwin.tar.gz"
    sha256 "5c884f2407c92ce586af4e969976ca8a5a6a900ce1b363c5c26b75557c5831c1"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.1/rkat-rest-0.9.1-aarch64-apple-darwin.tar.gz"
    sha256 "dcbba6030478dafcda8701a6f42ab835e5e6ad3a9076d2e6f7f4674153389b02"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.1/rkat-mcp-0.9.1-aarch64-apple-darwin.tar.gz"
    sha256 "47023664df2c78746090eaf27d15016dfe53d317d8d0d73bb41b4cd9fa3fc22e"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.1/rkat-0.9.1-x86_64-apple-darwin.tar.gz"
    sha256 "be8f87f872b81189d03c21ccb38811752018f138cef3bec338d36ad4e46871b9"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.1/rkat-rpc-0.9.1-x86_64-apple-darwin.tar.gz"
    sha256 "2e78922e0101839e622a73cdf722bf6bbc3ce953cea3b9fba113aa06a4659083"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.1/rkat-rest-0.9.1-x86_64-apple-darwin.tar.gz"
    sha256 "1f357e06439c1b05f2d670f85bec4b0da27e6a8b9f0f0d219b961378f4d6cc4f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.1/rkat-mcp-0.9.1-x86_64-apple-darwin.tar.gz"
    sha256 "2c55157572a3b99f271582935baaf23d00981f05ee777ac4953fd11fb9b2ae38"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.1/rkat-0.9.1-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "deab4358c73ab24063388bc4e26d7a6b7e8332998ed3474bad8cbcdbc94b3835"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.1/rkat-rpc-0.9.1-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "175bb49affd4d82f70dca4cefc2754ce69ba0e9cc9f8faa5b624865af2694901"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.1/rkat-rest-0.9.1-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4f59b47c793c7ba32bdab6cab7880edfab6f58b2eaf772cedfad450a0c211b4b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.1/rkat-mcp-0.9.1-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7c6d6c32f23ea80bd13d37bee16ed84e50d32b62f50875b737115225b3b20b51"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.1/rkat-0.9.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6cb6a29d22dcb5dd794054864765156ce1aaccaf3aff360fca27917a39465857"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.1/rkat-rpc-0.9.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "82d4485c2008e9143bf9f1d9d1488aeab4fe21b2a0a8c58cd77b18689bd407c9"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.1/rkat-rest-0.9.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "29521ad10adfcae6167185952be02be5546b7e5ac0d2a78cca8cc873d05359d6"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.1/rkat-mcp-0.9.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "30bed104f886cd6428b3d7f76d916789a0b9f670547786ccf5aa58175d50c85b"
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
