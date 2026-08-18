class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.24"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.24/rkat-0.8.24-aarch64-apple-darwin.tar.gz"
    sha256 "b0af907c7b19bd6df034e782c39184d6f3daed8ba7d36bf81c25efeea13b05e3"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.24/rkat-rpc-0.8.24-aarch64-apple-darwin.tar.gz"
    sha256 "442954687fdb2491c55755e1f12ccf74b635b3da219820b3640e55707bd5fc1b"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.24/rkat-rest-0.8.24-aarch64-apple-darwin.tar.gz"
    sha256 "6ea2712f50dcd177b5471576ce6e93a23db097473d8ad22d12aa139d40553ce8"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.24/rkat-mcp-0.8.24-aarch64-apple-darwin.tar.gz"
    sha256 "8ee857fe27e65949e03ce058c7baad7d1c8b32e065687c11da54ae70d3a644cb"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.24/rkat-0.8.24-x86_64-apple-darwin.tar.gz"
    sha256 "ae07c8da66aefb583c561fb747a2365935982ce0a2cb290a01701d8173b1cbca"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.24/rkat-rpc-0.8.24-x86_64-apple-darwin.tar.gz"
    sha256 "90e4f6644628aab8f6567e26f95909034abf6d217da3201df67f536dfee574b8"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.24/rkat-rest-0.8.24-x86_64-apple-darwin.tar.gz"
    sha256 "8d392b6bd641ecfd82b5995b436260fb30fb8f25b5f6d7576f98c79de8132d54"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.24/rkat-mcp-0.8.24-x86_64-apple-darwin.tar.gz"
    sha256 "e32d49e4bdcc4d30f5f9136124d3adb5307c7a24525ca9fe2eab80687362e9cc"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.24/rkat-0.8.24-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "53c330d5319ee972ea7445cf62032b8539a1b94d7a5634eea537166b478ec160"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.24/rkat-rpc-0.8.24-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4ab1f00d3cb454d5e63e9722d38ff5663d95c65f67dfb5f72bb0db43f378febf"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.24/rkat-rest-0.8.24-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0ff71ca871237bde49244f3b720782e4982e3d6cfc7c0cd650086a8aaaf2528f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.24/rkat-mcp-0.8.24-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8b07814f82df2ea9f4d6f63ae952c9ca76234fd57838c99ccba8a0027efad313"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.24/rkat-0.8.24-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f3da4722a56d32312a2b5b180cd6ed75ad39d26968ac7b1029be7bc59ce72302"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.24/rkat-rpc-0.8.24-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fbb8c4a6a31d3abb265b0fa79a4d0c3d28851cfffab9590fdf60c968056f6afc"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.24/rkat-rest-0.8.24-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c0d5691e978adc1e7c10f93c88f22489ef8636a329b15447c272bcfd4eb78669"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.24/rkat-mcp-0.8.24-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "685dd57c65895515c37e6ef6f1393ea365a640b895eecaec10da6b4098195e29"
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
