class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.37"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.37/rkat-0.8.37-aarch64-apple-darwin.tar.gz"
    sha256 "4504fd471a86e7c4645cb177e04c8539b33a4589f3ea22d88633d33c8f3017e8"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.37/rkat-rpc-0.8.37-aarch64-apple-darwin.tar.gz"
    sha256 "e5999b5c7a64ce5a0d901a44fd7f3311d9be1987761a596edbab1b0f2d92396f"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.37/rkat-rest-0.8.37-aarch64-apple-darwin.tar.gz"
    sha256 "f7794e9490841c6d60c8e7bcf5a0f51e714125a0ad1512ce40d18b8c3fed9c7c"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.37/rkat-mcp-0.8.37-aarch64-apple-darwin.tar.gz"
    sha256 "81c25bb454dbdeade63c34c802cb72c5054e62235365fbf078e2515ba07f100e"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.37/rkat-0.8.37-x86_64-apple-darwin.tar.gz"
    sha256 "2db358f4df1505a9c9a5d4954426d79922fdc1ec677f961d1963097ec948e371"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.37/rkat-rpc-0.8.37-x86_64-apple-darwin.tar.gz"
    sha256 "1a190306656e8399fa1d009dc0ac2d58bbed4a2ee03dab4710f8fa47ef9adf23"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.37/rkat-rest-0.8.37-x86_64-apple-darwin.tar.gz"
    sha256 "5d9108e81de98f6cb1b5f3594f4f6752ea61abc1401e69ae8d381b229338d2b9"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.37/rkat-mcp-0.8.37-x86_64-apple-darwin.tar.gz"
    sha256 "9eaae0920fce0a3ba261a94305f95b2984b57c8bc89a5494918453556d1b2540"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.37/rkat-0.8.37-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "42ecd55e62b4fd5545091715ae4ccd5592ccda94afcd6949563852a4be9ab43c"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.37/rkat-rpc-0.8.37-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1100fc3df2958013ca54e2a2f2e112d05f3640b759251abc75d4e57f88e73f31"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.37/rkat-rest-0.8.37-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "19ddaa17db71e865dc3b3c467aefbc012ef2ab7175702c3bfa1c2ffc2c1e48ae"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.37/rkat-mcp-0.8.37-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "81ee4d15c602421deb937609626a89dd92c372d07ec9fa264888323fb25e73e7"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.37/rkat-0.8.37-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "321bce135557f77a99a7419d66c848fcfedc34f90a1d33e3f36769adcaf2cbeb"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.37/rkat-rpc-0.8.37-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "24d9ad7d2f4782b8e5eab2e743129df53fa39fa1d832e80a777096cbd1d82370"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.37/rkat-rest-0.8.37-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d97b79389815f16579b0decb57fd2f3406f66c84b3e79a980ae67e9f344e0b1a"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.37/rkat-mcp-0.8.37-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4bd9207a8c38da1c83e57fe687a29d95f12e86e62e0eb494387bb933bd750efb"
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
