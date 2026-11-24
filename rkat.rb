class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.9.18"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.18/rkat-0.9.18-aarch64-apple-darwin.tar.gz"
    sha256 "c8fbaa295871d7888d1c25b9285ca65a262ac9bb0733f8c3c8c049437cb1d6e8"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.18/rkat-rpc-0.9.18-aarch64-apple-darwin.tar.gz"
    sha256 "c97af019689900d0ce671241f4e50d7aabc4bc5591ea93fc7f0f7af1f78c6282"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.18/rkat-rest-0.9.18-aarch64-apple-darwin.tar.gz"
    sha256 "d663c163fda998f753f8e6ddb57545d55850f8f7c1e3d892cce35fd37eddefbd"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.18/rkat-mcp-0.9.18-aarch64-apple-darwin.tar.gz"
    sha256 "7f1819a1c42c93950dfbc30ff90e636f09f2676b563ec56ff823d20869ba8d0c"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.18/rkat-0.9.18-x86_64-apple-darwin.tar.gz"
    sha256 "a6f007c9162e7f36fd4e38dea778bf3bd08f7a02138e2c37439a6922b089b816"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.18/rkat-rpc-0.9.18-x86_64-apple-darwin.tar.gz"
    sha256 "236be02866c98e0b3967eb6357832e8ff07ab8c1f220e56557e52ed0f4d6a005"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.18/rkat-rest-0.9.18-x86_64-apple-darwin.tar.gz"
    sha256 "0f047b1df09024af7a400b4f89abef02e4ca6b8243de0194bd31c9bb0023160e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.18/rkat-mcp-0.9.18-x86_64-apple-darwin.tar.gz"
    sha256 "cc8c32f6afc2541344e30ce1bae3c263478c5d2104f065ce5d5bf90f8ef72281"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.18/rkat-0.9.18-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "544943602bfc9f96c2bf939bfba0926eae217a8bcb12b088a6cd816a414231d1"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.18/rkat-rpc-0.9.18-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ce6ec0796a8bcce30b6cbb154daa5997be82b65b2eb205cea7de5071b79fea1a"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.18/rkat-rest-0.9.18-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "beaf716fa67d6ebad5b546fb70e667f342cc2d84e79cf8f0c08afe26a7ff5c1c"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.18/rkat-mcp-0.9.18-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0cb615d9d93c14793b95267361e7ecb4e6d16f50e7b1d4504d167871179a73e1"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.18/rkat-0.9.18-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6586fc222246a210073446462e8f684af979ac8cc85c1cfa1ffc869240921252"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.18/rkat-rpc-0.9.18-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4cb6ab80aad5ae2a47dc349ba3281faad779aefef774dce524b610d42782ef0f"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.18/rkat-rest-0.9.18-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b826fab651867822dee9889a074c945eb04239f8f88e262cd620bf5c3f3766af"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.18/rkat-mcp-0.9.18-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c01d357440e1bca647a3ce71f453fe4fb4f070587e89c9bdad818d5fb4eb9439"
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
