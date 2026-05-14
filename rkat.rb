class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.10"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.10/rkat-0.6.10-aarch64-apple-darwin.tar.gz"
    sha256 "5586c66eb9182a11a5d86989ae72669ac9bb3b369af5bdf55b3f84c9777371f0"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.10/rkat-rpc-0.6.10-aarch64-apple-darwin.tar.gz"
    sha256 "9e825f7c2b4b6395f3dafa969ec4b9a844c7fd4bb929dfc31b78ce9fa4f56494"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.10/rkat-rest-0.6.10-aarch64-apple-darwin.tar.gz"
    sha256 "ca43d71e2b1053ea7d434d9f934210e130d7bd9e98cf39b82364db0d2c2ff259"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.10/rkat-mcp-0.6.10-aarch64-apple-darwin.tar.gz"
    sha256 "0e99d5b4846828250ea7edcfe5b6fb5d20539c6017104662530cff4df5251b6b"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.10/rkat-0.6.10-x86_64-apple-darwin.tar.gz"
    sha256 "e26607aafacd63d3d9e6fcb54e6185a887e5a5b1adecc31b4fd92090c9825f59"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.10/rkat-rpc-0.6.10-x86_64-apple-darwin.tar.gz"
    sha256 "6d67ab54ca7a1db308fc9ba6babb6da50f5054b7fafd15d25528572baed09690"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.10/rkat-rest-0.6.10-x86_64-apple-darwin.tar.gz"
    sha256 "32f1504623d500846f1c49b45cdb8dcb1e600775986097c73e5f71c61da3f76b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.10/rkat-mcp-0.6.10-x86_64-apple-darwin.tar.gz"
    sha256 "2ba594fc76bf80ccd2df33a151b6d9572ee7288d4b1344b20d07af5576602fe0"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.10/rkat-0.6.10-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "eb98d9a2c72fae0b8eeaba2d586fb279d9d2a5378488803b78439008b295045e"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.10/rkat-rpc-0.6.10-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7d0d937a8b89712aa4a0dda4b83126dbc41988d65ab913f3184944efed7da209"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.10/rkat-rest-0.6.10-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2a8b6822461b690a72105753f372a2d2a4bc1d7cfbd2cf2bd2c40bba1cfb9240"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.10/rkat-mcp-0.6.10-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0b3892056a35aa81c2a611b44f3b8e1d8924db8f16861c8dadf7e8302e5e3b3b"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.10/rkat-0.6.10-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a3fd3bb82b618ae1cfd0b8e1a5ced47a8b2e639a284a5a78a084fa4b21bb2ffa"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.10/rkat-rpc-0.6.10-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4a8458c5b5f05937f1e98ec34f4c31e9b5ea0b598831f2067844d7172f656d5e"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.10/rkat-rest-0.6.10-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4844e20ed81585c8a1873940d227d9c0e05fec321da2ff8dc5bfe2f1701ec3a7"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.10/rkat-mcp-0.6.10-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d6890125e39021df542791507a4fd5d94cb5cd4fdd14289ccbdb30947622c37b"
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
