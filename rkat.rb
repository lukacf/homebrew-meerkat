class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.50"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.50/rkat-0.8.50-aarch64-apple-darwin.tar.gz"
    sha256 "f4e86e585b4c24435fcae4b09a11bd688ecbbed0e1dc9cffc7a609757928abe8"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.50/rkat-rpc-0.8.50-aarch64-apple-darwin.tar.gz"
    sha256 "2309f7dd37d81117ae7a89177549ae6e4d24872ad744c943f6e4d5a257d0557c"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.50/rkat-rest-0.8.50-aarch64-apple-darwin.tar.gz"
    sha256 "07cb26c09acc03d97e5444cff39f15487914642eeca29bdb1c3ac8546e167990"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.50/rkat-mcp-0.8.50-aarch64-apple-darwin.tar.gz"
    sha256 "7ab4658960e814f636b7d039a7094650d516a902b1f2cd2595b616ba1087b601"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.50/rkat-0.8.50-x86_64-apple-darwin.tar.gz"
    sha256 "5c73d34bb5a426a767585927f732450381552632dcb4ca80c5f51386e5d00523"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.50/rkat-rpc-0.8.50-x86_64-apple-darwin.tar.gz"
    sha256 "d425a06e84ffc95efa660da54945ba1569e4e406ddc0c2a9462329a87bff9b2d"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.50/rkat-rest-0.8.50-x86_64-apple-darwin.tar.gz"
    sha256 "0a6be996e1ddbef0c8c59cb5fc0658c20b2f1d2984187e9e0fb25f91a62fab93"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.50/rkat-mcp-0.8.50-x86_64-apple-darwin.tar.gz"
    sha256 "c89768484466032b4536d04ab9536969b213117eb0df5a1a95f95de919eb8c42"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.50/rkat-0.8.50-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a57292eba9a659d17cab511043a00252eafdad8a4881f2e138722b2959970541"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.50/rkat-rpc-0.8.50-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f5b1827215a2d5ebe77c7cde8e6f80893495d96f34e827560de450d0726ee294"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.50/rkat-rest-0.8.50-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b7a8d05c2114531b5639fb36a988f6bb0c5c96e6da9ec0c340de82aad2c4d6c6"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.50/rkat-mcp-0.8.50-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "48a1a793e22fc3b6376016d11843b6f9f4450486f954a88a54697b744a51cc96"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.50/rkat-0.8.50-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e60334973644a6dd8ba658a7a24b6c2d19aff328ea9a60a67e0e236343a52115"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.50/rkat-rpc-0.8.50-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a1e26ffcab1fdcb538bab9be152056409e86640ee58e0d3a44e4763ea8c0d37d"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.50/rkat-rest-0.8.50-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "db10b5cf4ddcf536d87bfe2c96940fb9b2affc00be25cf86d56e67b07dd10ccf"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.50/rkat-mcp-0.8.50-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c1d503b0f1716ca36a27270dee91685d23b69f4d8a496437921d51be4fe4e57a"
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
