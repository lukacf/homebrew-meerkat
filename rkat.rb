class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.23"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.23/rkat-0.6.23-aarch64-apple-darwin.tar.gz"
    sha256 "ae3e545809ea474a0dad7e3e274bfc53d96e3f43aaa99fa956f37c77594b4d01"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.23/rkat-rpc-0.6.23-aarch64-apple-darwin.tar.gz"
    sha256 "a5631ae32c4e0d5f22a9662d5f775bce639cffd90bd0734c9c776369c6b80a4b"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.23/rkat-rest-0.6.23-aarch64-apple-darwin.tar.gz"
    sha256 "75fa605f6f9fc1d9b85362adac2d411e43cc689c118d8fc12f16c85dfbcc0332"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.23/rkat-mcp-0.6.23-aarch64-apple-darwin.tar.gz"
    sha256 "d65be2b1c7909118a91086a349b7f437583441071489c2249ea854ba2a4e9809"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.23/rkat-0.6.23-x86_64-apple-darwin.tar.gz"
    sha256 "9e155de60944811c242b957b7626c19496c56bd06bf22031c629d4eff7b1d3bf"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.23/rkat-rpc-0.6.23-x86_64-apple-darwin.tar.gz"
    sha256 "9a39a3eb24a6b80abb0b01e1137a3cd069b879165531322b5eaf5c1e66276996"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.23/rkat-rest-0.6.23-x86_64-apple-darwin.tar.gz"
    sha256 "7259b8d978383efa6e75d69a1a0ab9b39ce9bc24df138f3defa56b635403b96b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.23/rkat-mcp-0.6.23-x86_64-apple-darwin.tar.gz"
    sha256 "4a1a89f2a679837c4a1a4dd838ef4f13d5961a086e3f8df2521fe004a382b8e1"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.23/rkat-0.6.23-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c7abd5c48872ce5b31a8ea0a20ff6b91bf7c968380148c9a5d47c23135c2e124"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.23/rkat-rpc-0.6.23-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8ad7b53e701c5d7c106405cdc3a7fbb5f34d9cac9dcb67c4d4690437374cccd5"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.23/rkat-rest-0.6.23-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "55495eeaed311ef0817740e83104481fdc437647bc1a15a617b67ea79508d2d4"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.23/rkat-mcp-0.6.23-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "cce2e7880c9a3babcd6ba8d12cdb34d2c75ac4e59561f15ea4a329c212de3a77"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.23/rkat-0.6.23-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "55ccbae2ff4a438694d0d9565abee28eb263e2b20edcbb808a4bc365ee67070f"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.23/rkat-rpc-0.6.23-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b573e1d60ce3c86fa4327ff24e69d29f243c7d7934034dc695f6fc446e477345"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.23/rkat-rest-0.6.23-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b0f0c6891a7922315e258530dcdce58386a8c6555218d82cf79f91003f00e7cb"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.23/rkat-mcp-0.6.23-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9cc3cfa244ad2c44de3ae2bc60a37e33e523c98dcbb2c416beb765b9de299bae"
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
