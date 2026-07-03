class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.7.13"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.13/rkat-0.7.13-aarch64-apple-darwin.tar.gz"
    sha256 "91633d7be514b39590bbece88f50c924c7d60fe10e33110cc55f45653c0fcd80"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.13/rkat-rpc-0.7.13-aarch64-apple-darwin.tar.gz"
    sha256 "e889cf559c1ee89d25395a27f9bebce539624848582e739d6c8eeef305ff6c91"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.13/rkat-rest-0.7.13-aarch64-apple-darwin.tar.gz"
    sha256 "59cacc146837c7ebfebb84abb62262fa43bfc860049d71fcb62a745994034442"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.13/rkat-mcp-0.7.13-aarch64-apple-darwin.tar.gz"
    sha256 "4a82e844fff9a71f3729681e8c0bd039986ba638fc3ea1b96876c1757dce0598"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.13/rkat-0.7.13-x86_64-apple-darwin.tar.gz"
    sha256 "e4e6e1b96fe88a7ef2a2d78acee670bc74f8092375f38fe6a838c2ef75775c5e"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.13/rkat-rpc-0.7.13-x86_64-apple-darwin.tar.gz"
    sha256 "4e1d63bb5346c2a2f4c1d60a6fddf1d83c2f6666a5b6e0c71da82334696a2fdc"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.13/rkat-rest-0.7.13-x86_64-apple-darwin.tar.gz"
    sha256 "5e4ba7b30a7e32e6f5b9102d7ce78be42b632cc19d81281ff29bd470a60bfc5c"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.13/rkat-mcp-0.7.13-x86_64-apple-darwin.tar.gz"
    sha256 "5189a627375c5457148e41d539aae7683a24808835f37bec10144cd3bede2af3"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.13/rkat-0.7.13-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7c70113df05fe23908b00845600de0a0d5cb007ed01680db943404de82c98a7d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.13/rkat-rpc-0.7.13-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e81ce09bf83e9ed2b64dde814433e8d85b83dae1f8a8c94179cb584844c03450"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.13/rkat-rest-0.7.13-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "75a770c217df3d8e0898a31c5a03cfaf3f0d07c24596b35fe0d16528a5269335"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.13/rkat-mcp-0.7.13-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "36ab658a3d36b36660bf8c8eeea13b28958bc33324b0d36a24c563c558e1a42d"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.13/rkat-0.7.13-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ad3160b48943d11626aeae2d9e30a6fa8b1d8b20e747ebdb268cf6157b59eb32"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.13/rkat-rpc-0.7.13-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "69385e8e66a6121d3ffa36f8d6d44880c3bfd1512d5c928b2d6ffd50270d110c"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.13/rkat-rest-0.7.13-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fafdd8c124cdaa07fa16cfee8b80db6300748012582bbcb1cd6bb986e6c7ba6e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.13/rkat-mcp-0.7.13-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a6800b135ada41e007dcfc1f00b85d99f28084f672ebbcbdf3bb68a953bd951b"
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
