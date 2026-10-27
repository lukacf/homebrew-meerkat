class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.9.6"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.6/rkat-0.9.6-aarch64-apple-darwin.tar.gz"
    sha256 "602a575a77e70abf5884df491199d577f1000d667ac647a702f9437676a9f454"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.6/rkat-rpc-0.9.6-aarch64-apple-darwin.tar.gz"
    sha256 "e1ca69072aa2b9d82751e77337e7df6b0426925937d03c2ec1a3aba3e2f804ad"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.6/rkat-rest-0.9.6-aarch64-apple-darwin.tar.gz"
    sha256 "fff86c46c9b555bf90014c11ae896ed59d89349fa9b8d90520c70322c5995383"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.6/rkat-mcp-0.9.6-aarch64-apple-darwin.tar.gz"
    sha256 "e4e5fcac2659e21fe9e6e7c5a6afb94fdcf7107e29fdff91092d56e5a48c7769"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.6/rkat-0.9.6-x86_64-apple-darwin.tar.gz"
    sha256 "fd3718f1434585724083debde47257de2f08db2e2bd2d22693b7ec27b45dafe1"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.6/rkat-rpc-0.9.6-x86_64-apple-darwin.tar.gz"
    sha256 "cf8d6094a1f28393cd50291b7fd0fa375eae1fcce8e72fd889812811e94f504f"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.6/rkat-rest-0.9.6-x86_64-apple-darwin.tar.gz"
    sha256 "704fa6f5429034f4a1390f1d827a70cd144cfc6eef600a90540f67b61a2af375"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.6/rkat-mcp-0.9.6-x86_64-apple-darwin.tar.gz"
    sha256 "5111cf5d57af6535edc1a56a847718666964365e5bded04aa50be74aa78562fb"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.6/rkat-0.9.6-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "972e5d074459c31b114270164d76fbde3e57a9f49881126b53887bf597508a0e"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.6/rkat-rpc-0.9.6-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6465eba41530a00fdaf8c02df85b45fdebd7084178065a420bf3cf10a88c8ba8"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.6/rkat-rest-0.9.6-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "43a02c4a35946b77486e7c08b3cb9c7ebbdb657962bb2f55f9e43c2c882509c0"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.6/rkat-mcp-0.9.6-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d062058d040050663fac65ae9e87aa22a9127c158c49bc1ba8d3a1c85645fa9b"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.6/rkat-0.9.6-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1af5042499d8e3c6b7540030b8edd04e0ad18e8930b13362abae87db141833d1"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.6/rkat-rpc-0.9.6-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9c08c65bf19ed994c3df7945c9c09047b033c3f5e2749d0d6df17e8951cb320c"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.6/rkat-rest-0.9.6-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "baa04e4c51f02e1a68a7debd345e0d5fccc8934616dda480e25acd3fa6e3b9b5"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.6/rkat-mcp-0.9.6-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d1b260ccf7cad61cb0b76150c284564fbc92916f4261557194c1364c816c99bb"
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
