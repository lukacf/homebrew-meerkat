class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.36"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.36/rkat-0.8.36-aarch64-apple-darwin.tar.gz"
    sha256 "5f8f8f341e3c49995a73ce08c16246684b915fd7588e6f396d70804c04ce0f51"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.36/rkat-rpc-0.8.36-aarch64-apple-darwin.tar.gz"
    sha256 "50f914cb7bb295fb2bcfb506a066f362c78a6c878ee27938a63386f0d271a015"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.36/rkat-rest-0.8.36-aarch64-apple-darwin.tar.gz"
    sha256 "daa44f984c39eb1a596183b8c382a5bff62c760802fa49a26686f732d58bfe0e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.36/rkat-mcp-0.8.36-aarch64-apple-darwin.tar.gz"
    sha256 "8b5fe322183321f5eda1161274faf85445f532df0e70c32d6c00827d3b56d197"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.36/rkat-0.8.36-x86_64-apple-darwin.tar.gz"
    sha256 "37d69d94dd7668b243a81ef52e22303a42fee14c3ed7899e23a5848dfe7841f8"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.36/rkat-rpc-0.8.36-x86_64-apple-darwin.tar.gz"
    sha256 "c268c2efb5716ff090745729536b85eac795d0f388136e399e1dd7ce8c728c06"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.36/rkat-rest-0.8.36-x86_64-apple-darwin.tar.gz"
    sha256 "cb20781b87a395466aad8037f8d5fce338d3e85356d6c2171e3112d46d761d20"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.36/rkat-mcp-0.8.36-x86_64-apple-darwin.tar.gz"
    sha256 "48337e29b60852c2d9b4220ae32eafa1b1e91f0ec114b07920876a147a63baea"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.36/rkat-0.8.36-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "457d85b8f31eea26c8cee8c536c4adbe8a331f3e2430e49359a4b73170867d10"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.36/rkat-rpc-0.8.36-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "af997b26c11d6c482b82f0b8b91968481e4424c2af70ed5e470111e2a7e589b4"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.36/rkat-rest-0.8.36-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ec8bb7adfee52dc68dd686299b1404da0ae2768b047e181cdbb851d95238052d"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.36/rkat-mcp-0.8.36-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "761758dddde8b596f65fbb43bf8f2f413e754ad220441a1f4e52b5a5e47c5424"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.36/rkat-0.8.36-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5b16668b3d22c4dbe2f5c42bea6e5fd98cb5c04f4e99a6c78a0cd6b41229717c"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.36/rkat-rpc-0.8.36-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "baed13741d8517f154b5780eb723ee928bd5ac3bd97066ad3590cb689eb6aa21"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.36/rkat-rest-0.8.36-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "606727764788283bc4fdc6211fdba922aa5590f5c13c2ead1bce616c6f49d9d8"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.36/rkat-mcp-0.8.36-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "acc226b6d79ed760de404aef0d5fa365045081afb662def3bc88571e1393e8e8"
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
