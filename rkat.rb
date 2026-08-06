class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.17"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.17/rkat-0.8.17-aarch64-apple-darwin.tar.gz"
    sha256 "517f472525f551ec28768859571028c1eeb1c705b0e967bc21d14af5cdd05a8d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.17/rkat-rpc-0.8.17-aarch64-apple-darwin.tar.gz"
    sha256 "fc0ba0f3c85e03a16239f7cb45a8e0ab023f2aacd2fc44f91ef9644e775b03de"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.17/rkat-rest-0.8.17-aarch64-apple-darwin.tar.gz"
    sha256 "a7e1a67c3a2d4e1612b7302d2a7cbcf5e228bb3a65df24c1802f2739631166bd"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.17/rkat-mcp-0.8.17-aarch64-apple-darwin.tar.gz"
    sha256 "21463ff6cfd2f9963f4394af714a93680540e25e5de936f13f2c994fe7deb5ac"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.17/rkat-0.8.17-x86_64-apple-darwin.tar.gz"
    sha256 "045fdebb28acf525808684b46282582649effc6e41af6e314089539c9602dc71"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.17/rkat-rpc-0.8.17-x86_64-apple-darwin.tar.gz"
    sha256 "2de63248366ec15a827c0c76e7cf21fdb43bddb71f88b9a5089920031815a816"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.17/rkat-rest-0.8.17-x86_64-apple-darwin.tar.gz"
    sha256 "d06bccafe38059c544c71246853bf4b43b02e27783022ce05798512ce32ce96c"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.17/rkat-mcp-0.8.17-x86_64-apple-darwin.tar.gz"
    sha256 "a423cfa9d6467955cc6aea02be4d18085d3d58d238aeb2eb99d550c057539ebd"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.17/rkat-0.8.17-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b46a97b290a0c0db1cf137b8daf4707590b0ec7ffe2078963d8f9f3210fee0cb"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.17/rkat-rpc-0.8.17-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ebd9874270b53e9c656c409d91efc0eb1346ccff6bf9532b8fd71006f91053a3"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.17/rkat-rest-0.8.17-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7baecbe6e4745deeef3b920ce830e88b7b94fe3c35d5ec020fda06646a3e3565"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.17/rkat-mcp-0.8.17-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c2e2bb66894207d067044ea41146de65926b347d12f06593b3227c140d7805d3"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.17/rkat-0.8.17-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "748a060bf864127b7690d73d7d4245a3d4e7dc5bb773172e002523076dfd38c1"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.17/rkat-rpc-0.8.17-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0d1db858a193ff9c953e5c7c5a82774c604d948f6cf91c86c9e40d5faac7fa90"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.17/rkat-rest-0.8.17-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d849d9f361c117e680b328ad070f02976c72602663060ab9732c0f07d33760a8"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.17/rkat-mcp-0.8.17-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "00415313adb7774a00eabf18d604fa531b3addde6af613ba957d15121e6109f8"
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
