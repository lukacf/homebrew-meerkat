class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.51"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.51/rkat-0.8.51-aarch64-apple-darwin.tar.gz"
    sha256 "1446ced03206964f66f1e736f446d5f7ef0625f39ae335773bc242e149b41208"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.51/rkat-rpc-0.8.51-aarch64-apple-darwin.tar.gz"
    sha256 "07afb4b3fbe0d1c555ca89d8d0125c5ce778895df2de591f442e0798ff32a529"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.51/rkat-rest-0.8.51-aarch64-apple-darwin.tar.gz"
    sha256 "af393c8fa3a07153e0e3277969e62cf354752976df7bdaccc7ec62cf99749b12"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.51/rkat-mcp-0.8.51-aarch64-apple-darwin.tar.gz"
    sha256 "2d7bad1b4cae6117a699e3ef94aab3dba587c7bc560ece6a7e4b981449edc1cd"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.51/rkat-0.8.51-x86_64-apple-darwin.tar.gz"
    sha256 "a3988a4b1ee006f7f0dca2d46cb34acb65e3183b736fc315249b84992e40813c"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.51/rkat-rpc-0.8.51-x86_64-apple-darwin.tar.gz"
    sha256 "53f8ef866dc230b788d30d490e1162461c1972156dfd4b91f453f9504682a010"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.51/rkat-rest-0.8.51-x86_64-apple-darwin.tar.gz"
    sha256 "4de571d0774d50d8917902414f806696b9d6c38065690172bcdcb1abb172d5f4"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.51/rkat-mcp-0.8.51-x86_64-apple-darwin.tar.gz"
    sha256 "a6b41c50356abf8b7e55b6f7c0026f1d5fb500a1369a274c9ea6777a5ca98c66"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.51/rkat-0.8.51-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "418e9571a5e2c5d77946fda2ced6d5d6414a1220656d5678f4161e6b71fabb9b"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.51/rkat-rpc-0.8.51-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b3e9d567f2eb8809f07b6b327acf972ddcae3f4a17d8eeba874f377070e326ae"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.51/rkat-rest-0.8.51-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f164e184eeff4ac6c6ca8855a2f6ad1bff6a3897030dcfceae9d281bafb87b1a"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.51/rkat-mcp-0.8.51-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4db4826e6c95bfaf01fd325fa14f9ba78615db1348204cc5519bd3d9bcea6864"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.51/rkat-0.8.51-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "01844642532e2312c28f8da10b7eef1d9882423379405d6cbdb4fd56afc76bde"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.51/rkat-rpc-0.8.51-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8f19ca9fe708147fd13e3a4c82b2101db7bd0bb19840a3bc270c5425db3f87f0"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.51/rkat-rest-0.8.51-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cf7d8b0c10dd3c6091b2d90ce07bc04a26563311b845964befae3b71ad3b91d9"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.51/rkat-mcp-0.8.51-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f8a90e2c16bf6e15336ab1a14e964b38aecbbfe346d064beaf6037a1dfdf2d1a"
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
