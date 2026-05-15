class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.12"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.12/rkat-0.6.12-aarch64-apple-darwin.tar.gz"
    sha256 "25277a73bd103514d9c8c79811ca092baa1b8d0b08789416d1fb3fe544505eaf"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.12/rkat-rpc-0.6.12-aarch64-apple-darwin.tar.gz"
    sha256 "c2154ebdb9d22e8866cff64caf4844a209cd6057a36a10de85220047e2914cbb"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.12/rkat-rest-0.6.12-aarch64-apple-darwin.tar.gz"
    sha256 "b83290408a2e41a386411ef9df08900083509779ddd9ddf01dfdb98a2f5cfd66"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.12/rkat-mcp-0.6.12-aarch64-apple-darwin.tar.gz"
    sha256 "c6c58bed92e502073711eb2486acf41fbc2a057abf6323cbfe90321a4d458452"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.12/rkat-0.6.12-x86_64-apple-darwin.tar.gz"
    sha256 "cb98c9c32c7b796395a6535031d1ca5d5d7b0032e2dc8b78468655c9aa4de334"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.12/rkat-rpc-0.6.12-x86_64-apple-darwin.tar.gz"
    sha256 "61cbfd5932432c8100eb6423e6ee217cc113ae3b696f1359e33432791b6f3d11"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.12/rkat-rest-0.6.12-x86_64-apple-darwin.tar.gz"
    sha256 "b754fa5ab9c670acd617e666fe9f0784d73920ffc60ad814e9c30001bc8dde6f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.12/rkat-mcp-0.6.12-x86_64-apple-darwin.tar.gz"
    sha256 "096fc2a382d6a74a7c3e48b584421e715ddd7e7fd17f6fe5fd2c2af69ded1888"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.12/rkat-0.6.12-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7a347a87003290b6464abf5bfbb934500504d814ae0b0dce7f55c2ad51105b72"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.12/rkat-rpc-0.6.12-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1b56cf73367b9afcb7f2b1576a257d97236b3df948bef728096ebb4413dc2db2"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.12/rkat-rest-0.6.12-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "bd4dfe4c66542316a4ccf9a138ebef4d67bb132a3ffebbc71b9cc847893e992a"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.12/rkat-mcp-0.6.12-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6e6cfbf7e444027411ef5ab47fef384bf0159c477a97a0c9eb44f2a0aa7d613b"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.12/rkat-0.6.12-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9021ae836d10ac93b9eda8878a2d21ec0956a269388368d9dca8096ed8d00a8d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.12/rkat-rpc-0.6.12-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e78ba03e89a8bc483862660ead5145c1b31a9f81e8bdbedb6fcca9ef4486bbb3"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.12/rkat-rest-0.6.12-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "544b73ddc67ddd354add244ade85f934dd56dc996e98bac2e0cde789a7505b33"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.12/rkat-mcp-0.6.12-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0087e97cf9b2c9959c7d7ddd99190d1ec241eb631566726eaa96ae2f41bcee30"
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
