class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.52"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.52/rkat-0.8.52-aarch64-apple-darwin.tar.gz"
    sha256 "7d34fea8b7b2acfb752aaa8b27629932ccb44cf1d2112a5fd2d937d99a2c24ff"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.52/rkat-rpc-0.8.52-aarch64-apple-darwin.tar.gz"
    sha256 "463464d1a6c893cd0a860c5d89133ffede4978f5c315bdd78b8d5d082410d812"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.52/rkat-rest-0.8.52-aarch64-apple-darwin.tar.gz"
    sha256 "4c9ec3c09014fc272dfb1c1cb95065b3dc4582246c51f1e8aa7774e22687a918"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.52/rkat-mcp-0.8.52-aarch64-apple-darwin.tar.gz"
    sha256 "bc3a8117cd8bb508bbfe8d9054ec457468d8f8e026b1284ef3f7c41c5f749bdf"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.52/rkat-0.8.52-x86_64-apple-darwin.tar.gz"
    sha256 "4f3937323c52063362fe994c33843377d174941e0f4805f2803d87f0220a2889"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.52/rkat-rpc-0.8.52-x86_64-apple-darwin.tar.gz"
    sha256 "a83a3abdb6c8721d5617eb676e05c548418359fe5adeceeda4c8e60c4e018a0c"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.52/rkat-rest-0.8.52-x86_64-apple-darwin.tar.gz"
    sha256 "0cd5773a9f1e3f7fdac8d7a2bea668bcb9aaa701d235ab626240cba2fea08ea1"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.52/rkat-mcp-0.8.52-x86_64-apple-darwin.tar.gz"
    sha256 "290578c63caf105f05d41876c086d55d815604aa77dbe6c629730dae2cdbb7e2"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.52/rkat-0.8.52-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8d1d4d93f5e31427a0c57c424ea24996c726ae0eb658e2733bf16d0493054944"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.52/rkat-rpc-0.8.52-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c5d70c7308d1b6116d5b2ec5339386031cfa7dcaed47a9eb008408042538dc09"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.52/rkat-rest-0.8.52-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1f54717ac773d0bb519cbed9e74538a4468368bce2e67570f9a1d76328eb664b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.52/rkat-mcp-0.8.52-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b6f3dc47c752c5e637a061d19253d75783ac3caa65ceba08cba06da53f00ed90"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.52/rkat-0.8.52-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a6215e1d6e70925ad8f35cd00f8b134f9874462f41056f9d4cc2be257edc9cdd"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.52/rkat-rpc-0.8.52-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a64fa8ce74b09d494a5e1848b20c89aff3732346f18aec694eed70b92abd5584"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.52/rkat-rest-0.8.52-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "11aa48c03850db25d61aca55777e798efab58004c3d120e172b98ff5029cbf5e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.52/rkat-mcp-0.8.52-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c568d778b91f99ec9cb667c3511c3e8a1b8ea8ade0e2560d6075f0a9d0e80d99"
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
