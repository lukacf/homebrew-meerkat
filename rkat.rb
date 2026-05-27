class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.25"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.25/rkat-0.6.25-aarch64-apple-darwin.tar.gz"
    sha256 "547cff152a8d40682554b98b08b63eee4f33eea7f9c4dd2ca57dd4a3507f60e0"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.25/rkat-rpc-0.6.25-aarch64-apple-darwin.tar.gz"
    sha256 "510e38d4d285ebea642d36448fa96f83a3bbf569652e29d689c823de0620225f"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.25/rkat-rest-0.6.25-aarch64-apple-darwin.tar.gz"
    sha256 "9606e9ad3cb4204fdf1cf7e6422808422bb72a341c68147b24d50cfcefd4f9d0"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.25/rkat-mcp-0.6.25-aarch64-apple-darwin.tar.gz"
    sha256 "844e0668852ca855949ce76ce04df2a799f31a4b382b7512e377be62041e424b"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.25/rkat-0.6.25-x86_64-apple-darwin.tar.gz"
    sha256 "6dd0058f253b3d71a9616dcde3e41605fcd5e94681b37d0fe78c404b95b11569"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.25/rkat-rpc-0.6.25-x86_64-apple-darwin.tar.gz"
    sha256 "fbe8050965bc97fdcf79db81eb80344d16de5f5e6611d7cd23799cd18471ff16"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.25/rkat-rest-0.6.25-x86_64-apple-darwin.tar.gz"
    sha256 "8f8b3bd74ee118941ee736a41aafdb97087b72777bf1279caa011cbf99d9ee89"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.25/rkat-mcp-0.6.25-x86_64-apple-darwin.tar.gz"
    sha256 "98d8a5cb703361fe09b7bafb5468819ea52ef262e49122ad14c84ec9cba151f3"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.25/rkat-0.6.25-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3262a1ea003e98707db27eaeff6b2f716d24188b867c23fe79f4d3531e306910"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.25/rkat-rpc-0.6.25-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "bb93784649773732475e2a28aef7179048f380c03aa62b8a0e19b2fb539f241c"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.25/rkat-rest-0.6.25-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "488bdfe9af7a54aa32f4b6f05c6707f2738ce93b52b2f0599270538ab1514684"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.25/rkat-mcp-0.6.25-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f1fafcf3525526f0c0f3f35cb9ab94098f80c4f82b6a14095b2e2a554c3ea48f"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.25/rkat-0.6.25-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "df46a4d722272ad48982df16257f512b12862cab50b2008178e856cc6e961180"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.25/rkat-rpc-0.6.25-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fe596e66a7b437fd4384cad195c655ed06a11f7432652e0f07049244d9632bc4"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.25/rkat-rest-0.6.25-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c64cb3fb933f3a8543f0dbdd422b7094187460da6e4ef89097988d31363c245e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.25/rkat-mcp-0.6.25-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2677ed8e28bfcfc64d7be13d3b08889cbbc68707fbf06440a64dc3564ae5ac5f"
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
