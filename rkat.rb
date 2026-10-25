class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.9.5"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.5/rkat-0.9.5-aarch64-apple-darwin.tar.gz"
    sha256 "0ed149873661668e7e932548c4efa1a53cfa83ab9ea5ca47dd56f6b861d9faae"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.5/rkat-rpc-0.9.5-aarch64-apple-darwin.tar.gz"
    sha256 "8c61ce2d24f180ca72790e9758689355b3f4831eda2d84f15426bd0a4c56a42b"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.5/rkat-rest-0.9.5-aarch64-apple-darwin.tar.gz"
    sha256 "1057357d5cc28d1fa61659d8b3521ef614143138b288db40fd29f7f4080fb9ee"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.5/rkat-mcp-0.9.5-aarch64-apple-darwin.tar.gz"
    sha256 "15336264ae7452639265de303ed55d1348e0d5ac3d810ccaef7b8c1afd31f972"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.5/rkat-0.9.5-x86_64-apple-darwin.tar.gz"
    sha256 "8e44df8b1f095cfd508e449f85b14cc2452d0ff938ba4598bb1e13b7907d54d5"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.5/rkat-rpc-0.9.5-x86_64-apple-darwin.tar.gz"
    sha256 "9377940d0d956c94cdfb22efdb73df5c00c35093f3698725ad1ef61f3090104b"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.5/rkat-rest-0.9.5-x86_64-apple-darwin.tar.gz"
    sha256 "651834ac9388216e916040b172bfddb818161f9c604971a755c2dd1dcf266fa6"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.5/rkat-mcp-0.9.5-x86_64-apple-darwin.tar.gz"
    sha256 "b3006ef06683e370175de81d3bd3dc611502403b435aa4013939d7bd9d4f77f7"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.5/rkat-0.9.5-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4b8e76f0cdd1472eb4386085fec6888818281f06496b9d7caea41d3856c83f58"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.5/rkat-rpc-0.9.5-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4a3381f97cae24f769bfac722808a51e67a494ba72025615b4ddbffde0c39366"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.5/rkat-rest-0.9.5-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "217a7bb8b68d76cf2cd787f917cee0124b0d5dab382222e4a48780ac86dd9c70"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.5/rkat-mcp-0.9.5-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "643dff8a04f7cec518edb3c7d4f16a3e946de2ff83aaa03ab64b1dd086d1bd66"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.5/rkat-0.9.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fcab278b3753b4543075acc75583756dd668803680c6cdc7e363af22db99b237"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.5/rkat-rpc-0.9.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ecfcefcf049fc156ca296b6001c8e3fde021b9df85fdfca0bbdd7d223ba6449c"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.5/rkat-rest-0.9.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "82946e0184e739d4509acc13bdf05514d92021febc58245e225f9ece2dad0ef8"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.5/rkat-mcp-0.9.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "45029152e4d314dc1f17f54b169c36ece983d5bfb039d4c95bd1bccbbbd83915"
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
