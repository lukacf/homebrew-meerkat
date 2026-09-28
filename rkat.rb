class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.46"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.46/rkat-0.8.46-aarch64-apple-darwin.tar.gz"
    sha256 "a2b5811db14c1425ac29033048dd6ddaa12e5201ee65e42b5fcf43c7deb6f1fb"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.46/rkat-rpc-0.8.46-aarch64-apple-darwin.tar.gz"
    sha256 "a068e69e7fbb2dabe45a4a54725ab292c316a68b3bb0d8f60253376d26e28e13"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.46/rkat-rest-0.8.46-aarch64-apple-darwin.tar.gz"
    sha256 "494c64b90688d20b4c75463d0b8da7474874548ac7947c741f509be62d863693"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.46/rkat-mcp-0.8.46-aarch64-apple-darwin.tar.gz"
    sha256 "ba6bac880545fc3f230f2e0ff2269484a8409d8c128546fe49df75c82105ef83"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.46/rkat-0.8.46-x86_64-apple-darwin.tar.gz"
    sha256 "ff9ad4d209df562ccef85b788f3ef040a07592e22cf1ba9fdd82276aef1f3591"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.46/rkat-rpc-0.8.46-x86_64-apple-darwin.tar.gz"
    sha256 "6fcdf593f99aa8bb5b4c2ce36a6e072697be54a07831bdea6e7b8be40397508a"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.46/rkat-rest-0.8.46-x86_64-apple-darwin.tar.gz"
    sha256 "72780c8559594b068419a75ee623d6be861fc5358091a765a5de9136b145b97f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.46/rkat-mcp-0.8.46-x86_64-apple-darwin.tar.gz"
    sha256 "dde11ef313bf83f2b38a7abaf3e06a53e1eedb3c5077a2d2f550cf994b05ae95"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.46/rkat-0.8.46-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "48a709259aa8eeda0e0f7538a5c8993c13279c9b9cf81f16656b6f8822eae12a"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.46/rkat-rpc-0.8.46-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0e7adde26e9277bad63022c20782b2737cb184dafe74fb8a66af623bb73637cd"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.46/rkat-rest-0.8.46-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "322cedb9ba12fe3f94871548326ca4311cbea9b53228ed3dbb754c7b400672ec"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.46/rkat-mcp-0.8.46-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8b5889425954527d437ab3a5dcddb4e8efc1d91f8a86a807cb17d71fa6def75a"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.46/rkat-0.8.46-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0d0ee66a7c2085b6b297d6625b99d5f0d070d2781539294e19717ca6d0f6d215"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.46/rkat-rpc-0.8.46-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0817b4ddfa4c4a1381efb599555f4ca832981a4ffaa93f3031ab072571832157"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.46/rkat-rest-0.8.46-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e7277980c2e38174aaf89fba3122e6da948135030c040eb03a6b0a2ab1c466ac"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.46/rkat-mcp-0.8.46-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6fe954981063f9f166880dd1fd2283f818f9c876805304b8af4987f22d85d8ea"
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
