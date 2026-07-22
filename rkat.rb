class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.3"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.3/rkat-0.8.3-aarch64-apple-darwin.tar.gz"
    sha256 "46d05c858cadb91732bb75c9b906f75eeae897c0978d97f6520cab3ca19afbfe"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.3/rkat-rpc-0.8.3-aarch64-apple-darwin.tar.gz"
    sha256 "b58755aba2b2b0f2e4e0e9c5c65d5d8bc9366d4ae67b680267f3b2b135a61181"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.3/rkat-rest-0.8.3-aarch64-apple-darwin.tar.gz"
    sha256 "fa5f839c7638e11ffc08c6bd39de149af6896adc60279484f68977acb7341e20"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.3/rkat-mcp-0.8.3-aarch64-apple-darwin.tar.gz"
    sha256 "29509d686d4401841443065f9729e857b8403651619b7b549c873eefa00bff50"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.3/rkat-0.8.3-x86_64-apple-darwin.tar.gz"
    sha256 "11b514b9661c49e80c445114f424bb4d7e8f9f250063e6f7319a00b5baefc959"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.3/rkat-rpc-0.8.3-x86_64-apple-darwin.tar.gz"
    sha256 "74c9760e3039ea7dcdc5bc2499af9c11db2095e8cfe8c9b7f1d6017534ddda6f"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.3/rkat-rest-0.8.3-x86_64-apple-darwin.tar.gz"
    sha256 "3ca504beb670293ff5114e8fca6d1071eb32b1e43c9ee566b6c73b2c3b638d94"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.3/rkat-mcp-0.8.3-x86_64-apple-darwin.tar.gz"
    sha256 "bd6696e44107b60b69f5e2d890d8c954c89209e932ed0741005a6fdde3764c72"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.3/rkat-0.8.3-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "34a723c738abaef571dce6af25bf2da3f3fc1225a9c36b2a142cb6f0626b4e06"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.3/rkat-rpc-0.8.3-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d88c1590078efdf6e8b6cea72aa2fdc08fe09acd42b8fc3d258cb6d26b1d9d74"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.3/rkat-rest-0.8.3-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "bdd22e164ec23a9be2a097317a49fc43d77886d1957b7681bb4e63d137eadd99"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.3/rkat-mcp-0.8.3-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b47d4383f4f11f16634dc5df801dee73bb961296b59429d4ed058552af2d519a"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.3/rkat-0.8.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "276975010658f0bbd0d860071469e407517028c14762ed23e0fab02f2ec811c4"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.3/rkat-rpc-0.8.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "03d102a60a486d800872660e463ddfebdcdd1a12a0d76d0ab49e0069c51b08c0"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.3/rkat-rest-0.8.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8e6d284700e539d43779d04b08335f422f3de2a2628e32b681271793e940317b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.3/rkat-mcp-0.8.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ae8d64a97fe07e954e24261cbf1a8cbac7b11f68c07cf6596c0dc1c1bd745b1c"
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
