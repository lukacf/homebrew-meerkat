class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.13"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.13/rkat-0.6.13-aarch64-apple-darwin.tar.gz"
    sha256 "c62f2084e5d2e4c4cc1f7ae00742639dc4384ce83405d81cf7fff7e4fa13f5f1"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.13/rkat-rpc-0.6.13-aarch64-apple-darwin.tar.gz"
    sha256 "72d2542aa17eee491964785fb3a47e2e88da51cc450ab373cece63ae3d890320"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.13/rkat-rest-0.6.13-aarch64-apple-darwin.tar.gz"
    sha256 "33cb35a5f2f5c57bd5ec562206183ec5bdcc9c1f9f1ea7076db6b36069626550"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.13/rkat-mcp-0.6.13-aarch64-apple-darwin.tar.gz"
    sha256 "9e74022fda4a91aa3cd6a02e77f1206942bae3dc6fb871cfb8094e3fa0a18ae0"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.13/rkat-0.6.13-x86_64-apple-darwin.tar.gz"
    sha256 "b812ae8912b2c1333282023561a6a530271dbf0639d35290e9bb933fd31d4689"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.13/rkat-rpc-0.6.13-x86_64-apple-darwin.tar.gz"
    sha256 "5cc9b68b98a4987bb852224c030c704b09c577dae16ddba5e598fdf984bd6b13"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.13/rkat-rest-0.6.13-x86_64-apple-darwin.tar.gz"
    sha256 "471ae8bc09298a0a393d2b58073901e4f6427449ec31afbcccabdf9af3b98e92"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.13/rkat-mcp-0.6.13-x86_64-apple-darwin.tar.gz"
    sha256 "471f9b08c2d0e7358b067fdade893925b2cfddf9b08ea076b3b104065f3f6a1f"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.13/rkat-0.6.13-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7942d46414996d7d09c2213b566e88af8f2c009e22c51ca3f6fadc9d903e77ad"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.13/rkat-rpc-0.6.13-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f6fadaa4319f917bb8fa62c17d862c7deb749d2bbe37572faa08719d4777c75e"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.13/rkat-rest-0.6.13-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "cc3e6edc05d2e613051561e57217421180d7bf7eacd908f568f34fe6053dc9db"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.13/rkat-mcp-0.6.13-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "82aa5eef9151e6d1a3ca51922922896ffe22e4ce53ba34a56587f0e9cf2ea111"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.13/rkat-0.6.13-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d4fb8aaab24a4668be691562233b8da31e7f166285f8f06b21b7b8697e6425a9"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.13/rkat-rpc-0.6.13-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1a40dfbf8e23e49a239f5e3750057bdc304af0c2161348947ed0066c5b6c47e6"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.13/rkat-rest-0.6.13-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5ef23f068d04d2fe5bb470cacec169c673c7e0d8d13d193273532eccc7cfbd7b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.13/rkat-mcp-0.6.13-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "674fa2ed8059cda04f5df32c2f926fddc9375c6138daac022f88ce217dbd9402"
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
