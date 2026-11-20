class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.9.17"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.17/rkat-0.9.17-aarch64-apple-darwin.tar.gz"
    sha256 "fb4be9ce9b698495c471094fa777e79060a3e8069c3c36a4cfd8ecad3231086c"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.17/rkat-rpc-0.9.17-aarch64-apple-darwin.tar.gz"
    sha256 "21bd1aa3567f6a3a236cebecc13fd7d8746860f255f7968cf1ccbd8616379d92"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.17/rkat-rest-0.9.17-aarch64-apple-darwin.tar.gz"
    sha256 "f773a93bd3c33ae2e0744cebcd520310bc20c9901e2960b9f283b9e9ae97a101"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.17/rkat-mcp-0.9.17-aarch64-apple-darwin.tar.gz"
    sha256 "f680d674ff6bdd548462ce19342bd87cfddcd1b6284043a10ce4379dcc8e90bc"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.17/rkat-0.9.17-x86_64-apple-darwin.tar.gz"
    sha256 "00a032d5228cc51ed92f4c36773ed922ee72fdb44bf01d8311c653e153c7961d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.17/rkat-rpc-0.9.17-x86_64-apple-darwin.tar.gz"
    sha256 "ac017cc69182f35a77c87c8a8533d01fa0e1275c71861b9cafd4759f7f9b4367"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.17/rkat-rest-0.9.17-x86_64-apple-darwin.tar.gz"
    sha256 "234da3299b0383182413b262975a23428ea407043220f6aefed133d5478da3c8"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.17/rkat-mcp-0.9.17-x86_64-apple-darwin.tar.gz"
    sha256 "fd5c43b7a920e64e7b2b2669327c46e1dbf0146e2e72a53f98f54ac30ed0ab7e"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.17/rkat-0.9.17-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1f29e8940bb72e53f5fa32cf0d042b4dfec1cd6e3db1d43f9f04f66ea0a55f27"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.17/rkat-rpc-0.9.17-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "437b6c73e1400826706ce3b08669c3a988e20ab21dab0e2d5770d9268c92e17c"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.17/rkat-rest-0.9.17-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b3dffac86d05e3c71cfb700b605ba560825753da91d1c9d310a47fe30152687d"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.17/rkat-mcp-0.9.17-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2238dc1a513daa2fbb44472aed48b07c143f27276e3b2c686c062b3ef39abecc"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.17/rkat-0.9.17-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "17aa2f39cdc14633e6fa53cb96db499f895917ab1ee916f7719803e50f341de4"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.17/rkat-rpc-0.9.17-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d732dd271838d0e7645d38b99f9b74b64cdba0725a94d7acf87e45011f3eceb1"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.17/rkat-rest-0.9.17-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5c9d3e3563d6086930b630a9a545d3311d2674d3bdbaee8e88b7d7b7f62c52b7"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.17/rkat-mcp-0.9.17-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8254c0f17e50bf507dc685e7db0cbd40aaac64a2ab5027918d9ec351cde99609"
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
