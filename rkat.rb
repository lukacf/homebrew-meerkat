class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.20"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.20/rkat-0.6.20-aarch64-apple-darwin.tar.gz"
    sha256 "9f868aa1ed21f4eecdf2d1ae4b991a2cb26fcf6de144eac528eb185aeab96d31"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.20/rkat-rpc-0.6.20-aarch64-apple-darwin.tar.gz"
    sha256 "4e58a97c136f6ed05dc32d0138f5f3bbb81be78a0a68d91c85c9da72c21a64a5"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.20/rkat-rest-0.6.20-aarch64-apple-darwin.tar.gz"
    sha256 "8e4e1f2d4fea2ba5d9856dd5a1a0761e993c0d756b5afcbc1bf661535c4fdae0"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.20/rkat-mcp-0.6.20-aarch64-apple-darwin.tar.gz"
    sha256 "52da6bbe87617541248500ea6749b864d0b448993abc779582c7c64b7222f200"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.20/rkat-0.6.20-x86_64-apple-darwin.tar.gz"
    sha256 "7cf60280dc84860543ed0404595fcb79a1ae405432674fc13017f3f0eae9eb41"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.20/rkat-rpc-0.6.20-x86_64-apple-darwin.tar.gz"
    sha256 "a62c39bad8b0db771d040ebfd721bdefd39dd09d0ddb571c5f34e601ac62f76a"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.20/rkat-rest-0.6.20-x86_64-apple-darwin.tar.gz"
    sha256 "2f8cab3b7209012f8010e660cbe81b684239832bc3b8d3f7a7b03bf18aa75be8"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.20/rkat-mcp-0.6.20-x86_64-apple-darwin.tar.gz"
    sha256 "7c08e550265c5d32eb9c5044c469a61203d7195a5ca0e97b838b57cfe375d9e8"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.20/rkat-0.6.20-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9ff792aee841d88e754ba9cf8dce6b2303d5d7da6b7265e79553c62b7c36eb9c"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.20/rkat-rpc-0.6.20-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d105bcdf10d497a139f39e561be1fdc1954058024629eb5bb65239deabfdb804"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.20/rkat-rest-0.6.20-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5892e6c39ab24a08e53dc45ee290da8b5e2acabdab7aeca6b093b5702a8fe28e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.20/rkat-mcp-0.6.20-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "df3050a2fa98e2f06c364ad08f68a7debb8a89a3c1ff1227b1e1340743d53f58"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.20/rkat-0.6.20-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "21c0360e514769b7c129e295bc3d3be60a107d4dfcd7f3b73da529a6223a6e2d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.20/rkat-rpc-0.6.20-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "762976bcb2ceba51be580cfe9028fce0dd4697ac7b263d46ca8de8c246d73279"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.20/rkat-rest-0.6.20-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "70828326cf1f19c2d37fb0c508cd4ecb0f3014da8c2e14cd1d102f8369dcff4c"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.20/rkat-mcp-0.6.20-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "03a0ff25858e5accbc5e525227bfa20b8539590323aa7bb0d3172c131e5fdc62"
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
