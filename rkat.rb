class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.29"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.29/rkat-0.6.29-aarch64-apple-darwin.tar.gz"
    sha256 "00b5abd38fddc8127aebd6eb6d15c049c56f895b7e17826811e9191940fedd60"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.29/rkat-rpc-0.6.29-aarch64-apple-darwin.tar.gz"
    sha256 "9c7b3d66b8c0a0f9d2901f01a6c1b714aeb549983ec3741a1237fd0417ed1b95"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.29/rkat-rest-0.6.29-aarch64-apple-darwin.tar.gz"
    sha256 "c9976acef4eb98cb8b5ac3a3730bae9b2ac436c816448a4e09a481c7cab86005"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.29/rkat-mcp-0.6.29-aarch64-apple-darwin.tar.gz"
    sha256 "a330122d74f64d74f0d16b10e3ee6da6ce65d2a3b2d58c7933b19ef441ffbd0f"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.29/rkat-0.6.29-x86_64-apple-darwin.tar.gz"
    sha256 "390b18b338427735be776d1cd471aee2ebb2eacf57fa3291cdf9fcc6e78af357"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.29/rkat-rpc-0.6.29-x86_64-apple-darwin.tar.gz"
    sha256 "3407499ac21537914a99e4cfff83ff8864e12ff7d591b23742b70d627693b1d9"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.29/rkat-rest-0.6.29-x86_64-apple-darwin.tar.gz"
    sha256 "e0c88e45e46eeab39ad4d0ec9c36f44307d1724912578af9f2cf657b41746417"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.29/rkat-mcp-0.6.29-x86_64-apple-darwin.tar.gz"
    sha256 "bb0940cb626c4d9f483e314ae40e1521df5f162f6275026fdafb95b604186d3d"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.29/rkat-0.6.29-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "762259b1f118d9276836b72e49afd37487129b3627661fea96a8dd0a53274e2d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.29/rkat-rpc-0.6.29-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0df8caa0cd9b0ffbbdf1d866e12210679e8d998fc4650c225d53e413957c2518"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.29/rkat-rest-0.6.29-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1b6a2959a5e6930842180079e8da03eb137b4276303506f19e23bbe6da8226fa"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.29/rkat-mcp-0.6.29-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a703c8049b6a3f70b8d6f0709ee5a2b25efdc07e597134d81636752fbe4d0a71"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.29/rkat-0.6.29-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9ebf8669a5e0715a74f0e5474202ff1956e2eec992e5e56ff020b3bad959727b"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.29/rkat-rpc-0.6.29-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1d9ba60c383923c7c07861dfb6fa8f76d1503ca905d47a18a966ecaaac15099b"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.29/rkat-rest-0.6.29-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "def7da02acaaf8fe8b6e0784034a0dc577a829910482aaad2612659a2ef14ecb"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.29/rkat-mcp-0.6.29-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "47b8ae66d9a75e25dea10bc01815e4aa8d173ca9fa4b76e756838d80e88d9894"
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
