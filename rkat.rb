class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.28"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.28/rkat-0.6.28-aarch64-apple-darwin.tar.gz"
    sha256 "e59b50cdd4d0b7cfdf975cf1595fd8fff5add15c7c72c6b1986e98805dcf1053"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.28/rkat-rpc-0.6.28-aarch64-apple-darwin.tar.gz"
    sha256 "99d336c44ff4616d0de15ddfc7fffd09c8196d0a2dcff6f5e5c40bf5a07df1a9"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.28/rkat-rest-0.6.28-aarch64-apple-darwin.tar.gz"
    sha256 "064c2a49fc029da675f7ed8f36170c0580e76deda6ba1f1b2da055f23f582420"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.28/rkat-mcp-0.6.28-aarch64-apple-darwin.tar.gz"
    sha256 "77968836341205eabdda49a158a695012feaf27b4c03565c8e6763b6bb7e2d66"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.28/rkat-0.6.28-x86_64-apple-darwin.tar.gz"
    sha256 "28a26ac3ebbcf831910bb11f52303eccb1a355d7518d0205e40a8d1483a1ad82"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.28/rkat-rpc-0.6.28-x86_64-apple-darwin.tar.gz"
    sha256 "aee140e7dd92bdbf1d8b89d5c104f609c67f6f1407a25715a55c3661b89a66a4"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.28/rkat-rest-0.6.28-x86_64-apple-darwin.tar.gz"
    sha256 "90b2a16d7c9279f583a784cdffe020db38301d83244a77b9e785153e15c0a9cb"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.28/rkat-mcp-0.6.28-x86_64-apple-darwin.tar.gz"
    sha256 "937db482d85b5b615fd33c8a3058893daa4610f1d5c8534157443cd8cd5a3c1a"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.28/rkat-0.6.28-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "34f125d4e3c26c2b2b1e0b4ae74d3a907c1118e1979e5678643afd0eafefb375"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.28/rkat-rpc-0.6.28-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "85c640c6ca3da4fac3ac73b27470fdec9cd9445ff4db3a308b81530e7fd182c1"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.28/rkat-rest-0.6.28-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "611714ed29b7506f67ba78bb77c3679122c816bc4d8888f9ac51d5d1e9f8ff30"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.28/rkat-mcp-0.6.28-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "dfb9e193f04ae4c3b6b77bc593b58d7089b2c852b51fd8c40d0cccae7d50ca3d"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.28/rkat-0.6.28-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f0bb04b37bdf95758d5aab82102685dbde0d3e33142916c3611ef338d314955b"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.28/rkat-rpc-0.6.28-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c9e0c84145f3505ff12757c10fc2c40f1a2ea9ce8460b99ea5d94e6f217df022"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.28/rkat-rest-0.6.28-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "aa5c76da0918b9c8b8d2d87fc014660554bb9254717b42b26f01a6e4e01d85d6"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.28/rkat-mcp-0.6.28-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b4c2aee8f76840cd5b3da1ad8710f1d2f7e195ccd46a58389101632b0cbbb6b4"
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
