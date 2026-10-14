class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.0/rkat-0.9.0-aarch64-apple-darwin.tar.gz"
    sha256 "e16ba50bf87cf24b817975fcb2ff462085c9e4bf4e2dee6444d2726a34fa6284"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.0/rkat-rpc-0.9.0-aarch64-apple-darwin.tar.gz"
    sha256 "f620b9097259787cecef2eae9c82150a4ea23d983b3979e68772ac982d4a0b52"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.0/rkat-rest-0.9.0-aarch64-apple-darwin.tar.gz"
    sha256 "700e2ee2a5e50d1eb1bfbe96cb1ad6d880ac39bfa45e4975e3727bd479375eaa"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.0/rkat-mcp-0.9.0-aarch64-apple-darwin.tar.gz"
    sha256 "1faed9d2b199fa06890892525a602199b84c907d73efbab4c97999f77fc79ea4"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.0/rkat-0.9.0-x86_64-apple-darwin.tar.gz"
    sha256 "2192b16313037c23000b8b0cdc0ac30ef158967cff6453d0c4a9c072852d1f98"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.0/rkat-rpc-0.9.0-x86_64-apple-darwin.tar.gz"
    sha256 "7897957b9c5a2efd5e4801fb8303e6e24d43a32e52173be9e35f062829872316"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.0/rkat-rest-0.9.0-x86_64-apple-darwin.tar.gz"
    sha256 "3257ace2b23cf1028c0fdb0b94fd06efd08993bf9a7c1b65f96b0a3b5e779c7a"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.0/rkat-mcp-0.9.0-x86_64-apple-darwin.tar.gz"
    sha256 "faf30af9ba746c7cc998de9dd46b3e5ed9167ae194b32b83ed79f538c85dd53b"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.0/rkat-0.9.0-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ea0fe4722521a82e9766dae634f28d7b36f10711043ba1cb73b5a2cf561d97cd"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.0/rkat-rpc-0.9.0-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "bf0bfb6a4e506199c2a704fb2d9e1152219c720f2d500d6b5bf4a9c350b75995"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.0/rkat-rest-0.9.0-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "74196b18b4e0a02f77fc567115124705ba57003c8ce1434c1df7d17bb3fc3519"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.0/rkat-mcp-0.9.0-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "387b153e8023aefd42554f6365a9f4a6ceae8b107e05d3dfb3acd2d275ba7b29"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.0/rkat-0.9.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "155c21dfcb26b721ffeae17dc9f99a090e0bd3852c936cffe867c97a26d3e721"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.0/rkat-rpc-0.9.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2681f1cbf9a0dbf668b37f5549609e4c5534ec68877265793a6faafaca4c1686"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.0/rkat-rest-0.9.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a76995f13b23cb4b75e63d6ee7c25beed7456086104e07ef0f8086bdcf1abcbe"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.0/rkat-mcp-0.9.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ddb03a162bc46e1fb531244a0dd3a24bc85693da709e2a26982b4b8798435a9c"
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
