class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.9.3"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.3/rkat-0.9.3-aarch64-apple-darwin.tar.gz"
    sha256 "c77b057dabd6c5df8d88c7dc466c855bda4d0ca66d8af6c1016a620e108c6f7c"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.3/rkat-rpc-0.9.3-aarch64-apple-darwin.tar.gz"
    sha256 "0d79ed0832c173d635e77a5212cb2d9330f758756c921fe4c3cc1bb91e27edef"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.3/rkat-rest-0.9.3-aarch64-apple-darwin.tar.gz"
    sha256 "a53bcafc6735da6318c1d06e04d3d519a7c9e2a8abfd3b8ce10d45b6ec4039fa"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.3/rkat-mcp-0.9.3-aarch64-apple-darwin.tar.gz"
    sha256 "3efb0cada9ae21594b14279edfd5aeffed93c76ce006249f4b8ad7004b615314"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.3/rkat-0.9.3-x86_64-apple-darwin.tar.gz"
    sha256 "11f662bb488d0b191b93d907d79b74a033e1533590510adf4fb8a80849e03418"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.3/rkat-rpc-0.9.3-x86_64-apple-darwin.tar.gz"
    sha256 "a5ccc86e77c2b923c507a9c93cb57c97ee832bc941d15c6c09ce49ab56032136"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.3/rkat-rest-0.9.3-x86_64-apple-darwin.tar.gz"
    sha256 "e29af81e326bfca10d7de3a7b90dd27652b14499883e341d8a10f224d36f20c2"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.3/rkat-mcp-0.9.3-x86_64-apple-darwin.tar.gz"
    sha256 "261f15bda670fbbc863b9d5d61a508ca8a1844e8c74165b04053de28711a7797"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.3/rkat-0.9.3-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "24d7fd6f430b6169066649b853d1d5b18fa0127a00a66b200dcd6d20d38b3a61"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.3/rkat-rpc-0.9.3-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1ce11db9d99dc0e65602d9231f43d91bbee0ae9f6c15bcf427317db383fadbb9"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.3/rkat-rest-0.9.3-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7c132eb83e4bcea56635d00d2b297ffd1987b8d9664cc4ed85129e53dc266ff5"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.3/rkat-mcp-0.9.3-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9bca81e31e55e884a50168c8a2bce8d34fb46e41a467219af5f702ce8fd3fa72"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.3/rkat-0.9.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "02f47dee7559f6210e0ec497af503b47fe4f0241fc8722daeb2a4a759c0cea63"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.3/rkat-rpc-0.9.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b2bae7f153c6599d5fbca30773abaec0d1889dd7dc141a8da98af5d291912041"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.3/rkat-rest-0.9.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5ab28bd1baaad913b1eb7b0ece5f7f5a175c21ceec119f31efa0baa9e538820d"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.3/rkat-mcp-0.9.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7ec87c20295d639d0d7d80fd996e5eaa807a149df9b9c7bfe5100fc742c1c43f"
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
