class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.7.17"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.17/rkat-0.7.17-aarch64-apple-darwin.tar.gz"
    sha256 "53a159b938a4fc6b9686a6fd34f22f712156397efea1acef5feaa439c6023c91"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.17/rkat-rpc-0.7.17-aarch64-apple-darwin.tar.gz"
    sha256 "7cbc632db6842f4a8a5f71056a780453b7b8ea73a4c1a5931c107ae11ca4c312"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.17/rkat-rest-0.7.17-aarch64-apple-darwin.tar.gz"
    sha256 "d033e1fbf4a6dabe3396a18a1a09ff654b2f8d67164f89585ffc0ac34035b15f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.17/rkat-mcp-0.7.17-aarch64-apple-darwin.tar.gz"
    sha256 "126fe98886c635b557d62339b191aa9bc808c3bdd87a40d78d39edc5871c7bbd"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.17/rkat-0.7.17-x86_64-apple-darwin.tar.gz"
    sha256 "434a5132790a08338a076f507ceb564eb2ab8ad8111ddcf786e7ccbb0635b4d0"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.17/rkat-rpc-0.7.17-x86_64-apple-darwin.tar.gz"
    sha256 "098e07b6c6db22bcef0a26c89bca15c981fe19701e9f9e32a3aca73c06db46f4"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.17/rkat-rest-0.7.17-x86_64-apple-darwin.tar.gz"
    sha256 "6fcef11cf65d2ce77ff2b250e374671702fc8aa99b73635e789eff2c86ca9d1e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.17/rkat-mcp-0.7.17-x86_64-apple-darwin.tar.gz"
    sha256 "5a923f462bef7a04f7780d24f1d30428058d3be0d90ea0bf352ec83dfcdf7a5c"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.17/rkat-0.7.17-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3b5b4413bbf3abe29b3a8997945a31ea99173386ceaffe04d85222dc266a0d11"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.17/rkat-rpc-0.7.17-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4c907536e3e6d7cf142dcc8843ff73c922478be8672e9ecf387a4cb3b342fa43"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.17/rkat-rest-0.7.17-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c8812e0d89d6b07c0a711da2ef4a048746e42ff3cc5b7bff9c3beb5c44753504"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.17/rkat-mcp-0.7.17-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7c0bce795480f6d2709a7c57bfbd217236d9c5b5786121fd4c6c7db6de12d760"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.17/rkat-0.7.17-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9975560c5cb4be4f4de4b553119fbbd704b1f7b33cc1d33a9ce696d36f39ca03"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.17/rkat-rpc-0.7.17-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bb7094bfcc77f1d0b0284cd00301d7f2047c88c9c50d3ececc2583e6214ccd6c"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.17/rkat-rest-0.7.17-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "79ed8e9f19eb3dabff26ef23e9757ab7b982924ccf1327d263c17aa6ced0d442"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.17/rkat-mcp-0.7.17-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e18073dd056547ec96bd474f0153faa4f5c3256cf41a08920ab62c56bf03efbe"
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
