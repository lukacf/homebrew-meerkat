class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.6"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.6/rkat-0.6.6-aarch64-apple-darwin.tar.gz"
    sha256 "24304b3df64bc2c87a8f8ef4c5faaaeac2325953f39c48fe50f588c79e45d5d1"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.6/rkat-rpc-0.6.6-aarch64-apple-darwin.tar.gz"
    sha256 "bae059ad624877825170610f060fde43f75170162a1440bd0e097609904a2d17"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.6/rkat-rest-0.6.6-aarch64-apple-darwin.tar.gz"
    sha256 "5264325e8ac368f48368c5aab7e74c9fdf3f4f630656f0e664c3f091f948832a"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.6/rkat-mcp-0.6.6-aarch64-apple-darwin.tar.gz"
    sha256 "83e465ebbc23c7eb877ef7e7d25d87cfd4e735f9df016fadae4a15a38c7e5680"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.6/rkat-0.6.6-x86_64-apple-darwin.tar.gz"
    sha256 "c41ba41043cb60f2d8778be07e34d0b7bc9ddd435862c8c41b63c3d36cd35d20"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.6/rkat-rpc-0.6.6-x86_64-apple-darwin.tar.gz"
    sha256 "efa5e5096df624cdbdd11eeac8506ce0b905ea157c74dc2cc355fdaa88682ac6"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.6/rkat-rest-0.6.6-x86_64-apple-darwin.tar.gz"
    sha256 "935cab081d800d2774dd4e47d0eb2c58b26bf3d24b26af04ce7f4cf500924d1b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.6/rkat-mcp-0.6.6-x86_64-apple-darwin.tar.gz"
    sha256 "fa71fb41f1b2790c2de09c3006bf00ff6a021666b09799f11e0ef95ee81d34b3"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.6/rkat-0.6.6-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "fb6e2526c3e9cd6fbbb1923a866132074b485bf44134e62d2ab0448956f3aed6"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.6/rkat-rpc-0.6.6-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "abd77762dddc243f6d572c115325dbdc2ed2874751bbcc18026c4ec6a580bbab"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.6/rkat-rest-0.6.6-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "28e7a1918e840eaa3463d24d099f87537ecab41fd36abfb1d065791ab7ab0600"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.6/rkat-mcp-0.6.6-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f8fca89f12c37498669ce99ec1a16c94719ec23525b717f635d6f4af059f2f22"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.6/rkat-0.6.6-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bcaa11ebcbd06220be5f4cebb58b278f2c90efb413ec2c602007bde55f9c4857"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.6/rkat-rpc-0.6.6-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b7fcbea6876f60c6100d284c6c74e97cb827367bd85ad5ac64793713babc73d7"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.6/rkat-rest-0.6.6-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f96d79134316b27c15fb458abbaae200f82972bdec8b3249e9ab61fe352a175d"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.6/rkat-mcp-0.6.6-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a8ad2f4f3364f3093303b05ca8750016e1cb1d874348a713a1ec6cb34cea2218"
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
