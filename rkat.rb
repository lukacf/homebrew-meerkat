class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.7.24"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.24/rkat-0.7.24-aarch64-apple-darwin.tar.gz"
    sha256 "581e369bd7ccd6a258142d3f73725ada3084cc2a04d4800ac337bae0e512fda4"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.24/rkat-rpc-0.7.24-aarch64-apple-darwin.tar.gz"
    sha256 "5b61579131e127353d4a9c8ef5a403a09fe165a688068b356fb039d85604ad17"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.24/rkat-rest-0.7.24-aarch64-apple-darwin.tar.gz"
    sha256 "97571b1906dd50fceb59e13a79bd9147e5624635f8a1c6bcf7d596b3d84d779a"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.24/rkat-mcp-0.7.24-aarch64-apple-darwin.tar.gz"
    sha256 "dae0f82af1b54fd2afc42503b6f602e7faa0c44ec8e65b32503740548d9bd1e9"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.24/rkat-0.7.24-x86_64-apple-darwin.tar.gz"
    sha256 "75023085cdac6f5b93d90cd1d8413720c4a82fd12fd3e8a12d9d8bc9e2def2a0"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.24/rkat-rpc-0.7.24-x86_64-apple-darwin.tar.gz"
    sha256 "d6c5a02713915ba31456c4451a8bda73e7ef80e3477230b25cf090e46ca16c28"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.24/rkat-rest-0.7.24-x86_64-apple-darwin.tar.gz"
    sha256 "29236a3bd24349548fdb59f26dce63258aceb2345842fb02c4c2035c07cdc90f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.24/rkat-mcp-0.7.24-x86_64-apple-darwin.tar.gz"
    sha256 "52ed15bd3a304ff2f06f21780de472c978ce1d665a9f566e6c0bf5f1ef37dd29"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.24/rkat-0.7.24-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b6820c50e4bc993420ad008356db2d53da3a471c3397ed61897d50a77d02e228"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.24/rkat-rpc-0.7.24-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b99032e46406d908885abe9d8a267180b6f16563b9c7806b334d0340b6ada183"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.24/rkat-rest-0.7.24-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f57d3bee5ec7e9723095494f48edc9000d0065ab3cfa86dde3a438e34cfd4c39"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.24/rkat-mcp-0.7.24-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0b1369c957590fae7d5e92d8e4384ced461be76563ea18053e6fe808ccac23ca"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.24/rkat-0.7.24-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2c8220d03fd208eaa6c6bb6d1340f09442e5c8ac76fa07b81067cedc13864882"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.24/rkat-rpc-0.7.24-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "379bacdefdd1a2bdcde3e15a7dd3023a0a072fe5f42363f333f822ac9ebdfeba"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.24/rkat-rest-0.7.24-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "df558ff207f3c84e919c192f71163fbb9f98e72ea24cfa4ab05bbcd78b55cfd9"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.24/rkat-mcp-0.7.24-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "803544afe56bc9bca97cd9e55767295621fa63cd10f9dc7ae007e81e043b2524"
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
