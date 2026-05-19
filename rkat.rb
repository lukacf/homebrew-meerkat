class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.18"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.18/rkat-0.6.18-aarch64-apple-darwin.tar.gz"
    sha256 "a8c106f6d3d164fd616ca8180a3b16c3cc7b70dde0552c8efb60019e90704d29"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.18/rkat-rpc-0.6.18-aarch64-apple-darwin.tar.gz"
    sha256 "2efc5e25ebf060e5ded5de819c2e444044a9320147032e5fcf885a3d76f50b03"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.18/rkat-rest-0.6.18-aarch64-apple-darwin.tar.gz"
    sha256 "8b08d3fce29a1b17799097e0f468358a27a35ba571d73ae0e69928408c639e4f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.18/rkat-mcp-0.6.18-aarch64-apple-darwin.tar.gz"
    sha256 "6b718cb1320f6805cfcac9bbb485cfd4e033a906b750a779e721095efa14b700"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.18/rkat-0.6.18-x86_64-apple-darwin.tar.gz"
    sha256 "4dbce1b16d2ac023cab79bda75f8517ba842760dd2d01e7101a07a4b86f83393"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.18/rkat-rpc-0.6.18-x86_64-apple-darwin.tar.gz"
    sha256 "bbdc00e78c44d9843c4e0e7d777209151a41c9346ace70a8f810e393feb44c94"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.18/rkat-rest-0.6.18-x86_64-apple-darwin.tar.gz"
    sha256 "a8a94040d4870feeb2fa1538d1ea5fd00a1580698baf6daaf514b578b62512e1"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.18/rkat-mcp-0.6.18-x86_64-apple-darwin.tar.gz"
    sha256 "3267cb5fa46ffea45a16552d0f60c61ec2ec077cc7372da54e07784468449a52"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.18/rkat-0.6.18-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d81fe6eb8608ef5c992a9b5edfc2d410a837a1b9c8f62161ab03a7a236989bc4"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.18/rkat-rpc-0.6.18-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6e7d6734391c17e783047e1c5d0c18d3f5297827e3db1f3c652754cc48d4d19a"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.18/rkat-rest-0.6.18-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e04b39c4900e850b25b1c5f934bcdc6538b575eaf649921e007b59954f3be305"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.18/rkat-mcp-0.6.18-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f292fb1ccebc039ffca6b77312cfe5fdcda6fe763aa6d30f5e314e23d433e15e"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.18/rkat-0.6.18-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "98894e2158cd9d36a62a20ac7e59e8590af6210d5fe599aa76ab150f3ff96d5a"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.18/rkat-rpc-0.6.18-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b171e0fa070f7e390b81e977d4291ba4e784a2b57c254fc37619c2b3fba20e68"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.18/rkat-rest-0.6.18-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "185eba9c3c18eb69bb04d8015e723620379d4042beb335a77ef4f3d383f86076"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.18/rkat-mcp-0.6.18-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "beb34fd77400ce94b97452f6794aadc4011a135b3255521ae677f524688a4d4d"
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
