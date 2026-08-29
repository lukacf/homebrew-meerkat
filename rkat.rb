class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.31"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.31/rkat-0.8.31-aarch64-apple-darwin.tar.gz"
    sha256 "86b8c0dd41c17eb9124ae263b5c126191acdf47312acda6adf53bf5d17d4f400"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.31/rkat-rpc-0.8.31-aarch64-apple-darwin.tar.gz"
    sha256 "fde6e874297bc735710c7f82e212a2bf5685d2405f58f0d449647bf204e48bb3"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.31/rkat-rest-0.8.31-aarch64-apple-darwin.tar.gz"
    sha256 "7b1c920dd43ed444725ba44ee9ff2ae8ab73d923aec7e00592b452847edfef3d"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.31/rkat-mcp-0.8.31-aarch64-apple-darwin.tar.gz"
    sha256 "1b67f01a04873276f5084b62c3c953b47d9b1fa016a219f17d1817a81c6a6970"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.31/rkat-0.8.31-x86_64-apple-darwin.tar.gz"
    sha256 "14d22aa95040129cd3eb2ced0fa105d40cef18459164a35bde6410da9f614e2d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.31/rkat-rpc-0.8.31-x86_64-apple-darwin.tar.gz"
    sha256 "6c4df98b46669b3d735320c1a96928306eb902101a9ff549f647ea2503ba7b81"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.31/rkat-rest-0.8.31-x86_64-apple-darwin.tar.gz"
    sha256 "1b772463420a95f285df2bfef80856b5df7be1e531ae73cb37b57821488a4f0e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.31/rkat-mcp-0.8.31-x86_64-apple-darwin.tar.gz"
    sha256 "418d0cc946ba96891164efe8699826fe717c5fe4235b58e5b50d53a2f393be12"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.31/rkat-0.8.31-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "17e8070ce11fb4a0d97cc5c0f3273a8a23d6e6bbbdaedd68f7ce2c0c9aaeabab"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.31/rkat-rpc-0.8.31-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "95b12faa23f5b79fb8f4b299aa8f4aa4e9e5a3b00d0588261148bd590a2cad47"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.31/rkat-rest-0.8.31-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2c2bfe3e273e3026a2481b74f8b3008cc061e1ac3dcf3098ff1c3fdaf0db95b8"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.31/rkat-mcp-0.8.31-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4f39c4143e10dadd22b7b7fa21c8f8ac65edd45b9ab254ba9ad686a02e17aab2"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.31/rkat-0.8.31-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "619350a9ff5247b3494648231c16efb34a3d6f1edc7b9e0936b6b56f7099a0cc"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.31/rkat-rpc-0.8.31-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f9cdac8066140415288ef14fab549d9072162951ce13cd4a7fd6936e70223ec8"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.31/rkat-rest-0.8.31-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9bc9694866904ad09138d8811ebdc6331ece04d645ef224efc8512e2b6fc9299"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.31/rkat-mcp-0.8.31-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "671f952234e70777010ed52e0b97a17114b11d645fef3ff821a26c1729db8356"
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
