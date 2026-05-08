class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.3"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.3/rkat-0.6.3-aarch64-apple-darwin.tar.gz"
    sha256 "3912e842f01d6dd4839e5fe240308a945d358852913355766d91eca2685802a6"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.3/rkat-rpc-0.6.3-aarch64-apple-darwin.tar.gz"
    sha256 "a22eacbe0a0dce47a715973510dcb0999776ddbe47b30390430469d99330c432"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.3/rkat-rest-0.6.3-aarch64-apple-darwin.tar.gz"
    sha256 "3d7513b4f7c90b46a2f027a5a6528aea5cb9f8131e02772b852c24ad8fda9d37"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.3/rkat-mcp-0.6.3-aarch64-apple-darwin.tar.gz"
    sha256 "e46d64448b1a92a1605b8ab62ecc18aa80479a71b9c5ac7b7d1f0f43f0d65272"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.3/rkat-0.6.3-x86_64-apple-darwin.tar.gz"
    sha256 "4568fbb451fbeaab2305be3cc6f265bbeafae5630e8c994cd20add138b6aa40c"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.3/rkat-rpc-0.6.3-x86_64-apple-darwin.tar.gz"
    sha256 "efe07827a103e0b9b4dd7e4f6de8986d0db1fced3fba7584f1b0b7386e8df528"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.3/rkat-rest-0.6.3-x86_64-apple-darwin.tar.gz"
    sha256 "8c9fbfe4da91bd48919429e84255304e89efec70734a7a9754324434ffcadd5b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.3/rkat-mcp-0.6.3-x86_64-apple-darwin.tar.gz"
    sha256 "1e6a6482250b4bbc201189f58c8c539924a842d4c12c63134bc4e51735403b21"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.3/rkat-0.6.3-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a50c6d696c69e9474e6cfe9d751bb45dab416cb9ddfed4c732f1dd05bbae6f8d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.3/rkat-rpc-0.6.3-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1fa1544eb1c5ce687e01a28d5d53d96beec018a9e69fe465d9f084f06ce16cc7"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.3/rkat-rest-0.6.3-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "201179ab19b3071bb25ccac888dcbd13208904906cf967416d51d9c9a41b7a0b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.3/rkat-mcp-0.6.3-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9ba65ba4d6e8e28e1071f4de8c710382895afe9705e8c4ac2f61cd902b0bd58c"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.3/rkat-0.6.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "531bb5c579071346638556526578bd94adf4c6a595db93c15d4679a8c5da3aa1"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.3/rkat-rpc-0.6.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "26f647b34765944a4a2a922e81282ff297c31d8dc7bfb31739b1e4661f4bc898"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.3/rkat-rest-0.6.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ae32ed5ed2841d2c668aea51e21d3abd1a8b76fe6a5ff0de3e06e9e21b6eabc9"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.3/rkat-mcp-0.6.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "814b38b2a5a9604dde095b5333c1eb7231e174bb7bd1420e2a091f3a87684120"
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
