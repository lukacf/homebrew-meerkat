class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.1/rkat-0.8.1-aarch64-apple-darwin.tar.gz"
    sha256 "9a046a2ec0c37282f6ad6895ee813f15e91dd25ca097e93d3d7433ed60333d00"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.1/rkat-rpc-0.8.1-aarch64-apple-darwin.tar.gz"
    sha256 "e2ab8bb2a4f88ff49760c81e1586f14c8a281ff728f6b184ad5a321549a973ba"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.1/rkat-rest-0.8.1-aarch64-apple-darwin.tar.gz"
    sha256 "8c18e4c75a10280862494787addbda63dd89974557ce8ef145de46b4b1e443c0"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.1/rkat-mcp-0.8.1-aarch64-apple-darwin.tar.gz"
    sha256 "8ab5bf38bd13abb1bf1b630793b3fedf98b1615e34b9dc7339a268ef96397172"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.1/rkat-0.8.1-x86_64-apple-darwin.tar.gz"
    sha256 "55f8a4a8ad0e1fbdd9eb80fe8e5c19d18f214d58aee2b0e96247c97be74c69de"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.1/rkat-rpc-0.8.1-x86_64-apple-darwin.tar.gz"
    sha256 "7d43316cb1c670a3e25911fe89d183ea47d3056860c877fbef309d166f398f4b"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.1/rkat-rest-0.8.1-x86_64-apple-darwin.tar.gz"
    sha256 "9821357722476d8597df992939b4267c39e22de1598afd8b741e74505e7056c0"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.1/rkat-mcp-0.8.1-x86_64-apple-darwin.tar.gz"
    sha256 "35368fc458430165311259f69637569e931d002c57514297e6cdcc67bb2e11be"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.1/rkat-0.8.1-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4ded78c0ae3efff9fd33cd3b70bdcdc08ba8119c2625a21027781ed268b2d975"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.1/rkat-rpc-0.8.1-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "82bec0673fff0843d5c2f360c3c8ec399e353854968641e07f72e3989523b245"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.1/rkat-rest-0.8.1-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f5d23b7aa78da9e244ed615144e0968aca59360b4ce4250a4dc9b541b923ba6d"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.1/rkat-mcp-0.8.1-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "79cef14bc70b59482958f7e76e17181bc49d6e6aeb25a555bd2b12a167c74191"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.1/rkat-0.8.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "77f570cd1eebba865e92d0ef146290b6628fcf911f0f7f6c06357a779c75ab6d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.1/rkat-rpc-0.8.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a37495f7c59bb1fd99d69296d9712eb726dca006febf3b55236624933e5add65"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.1/rkat-rest-0.8.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "571475b52b81c2d48367dbf4c2255c453e4773e772f8648b2b9660f3d34af0a3"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.1/rkat-mcp-0.8.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "574b5d8825d5fc18581639bca593de529d202335a1c707cb0005834279891567"
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
