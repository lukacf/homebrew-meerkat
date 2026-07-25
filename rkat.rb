class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.7"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.7/rkat-0.8.7-aarch64-apple-darwin.tar.gz"
    sha256 "585311e3e302c8686e6228366e75dbabd3ce202b9be86f82e111d446a0fdc1c3"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.7/rkat-rpc-0.8.7-aarch64-apple-darwin.tar.gz"
    sha256 "f325e666baf5624c164842eb2014dd69dbcee301fdaad4b0c7bb72e702e39e13"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.7/rkat-rest-0.8.7-aarch64-apple-darwin.tar.gz"
    sha256 "c9235ab0fe476239e9b646e227fdeb1d53ee03662658f8661176dcac5e3d0d6a"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.7/rkat-mcp-0.8.7-aarch64-apple-darwin.tar.gz"
    sha256 "4dec5093ed3e1c1d83822d689a596ba0920379348eea22c513e18bdac59abbb1"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.7/rkat-0.8.7-x86_64-apple-darwin.tar.gz"
    sha256 "6f583a680143241cb221bc65f508f7cd2a09aaa1f8b4a0520bd3adcb6e540362"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.7/rkat-rpc-0.8.7-x86_64-apple-darwin.tar.gz"
    sha256 "37fd60e3e96ce815ef0ecaeb766b2a2b65f2f94e6c53f1e3baabba7129f6647b"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.7/rkat-rest-0.8.7-x86_64-apple-darwin.tar.gz"
    sha256 "0e4f13dd873e60fd81ad2f1f73e64b4e5ff655d249d1d30d1025cd00c8c836f8"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.7/rkat-mcp-0.8.7-x86_64-apple-darwin.tar.gz"
    sha256 "563f1190f61e61a6bc9ca4d92270c57b5c48093a8847f66defc095fe3972cad0"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.7/rkat-0.8.7-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "112c70b771dffb1794b5bec61b616f24541483f40900e28860a4b655bebd29be"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.7/rkat-rpc-0.8.7-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "dedcf29fd8608516ee933f13592a6cfe49b0061fd95c992307ef2174882dc084"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.7/rkat-rest-0.8.7-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "47a3ac1d5e947774d5d8e6fddd2186ca6df9f5e3816963c02b1bfe7f991bbc43"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.7/rkat-mcp-0.8.7-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a5bd7d809a93d4fd40acea93a6adf5b6aa07d15bd3e877665a8de0e0972f7aae"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.7/rkat-0.8.7-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c65e42259dd812fa0bc0cbed753f2e0da6705c4d9e39ac3b6a1c0999ff571bc4"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.7/rkat-rpc-0.8.7-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "164eb89371c90be1782224419840767dfe87016a5e2280e25d6df60440a0fe61"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.7/rkat-rest-0.8.7-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c6e454a6eca4d866aedfa298c43339364c5df998a9be9ca85f19f03b3ac74ce8"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.7/rkat-mcp-0.8.7-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4b13711c019cbd5c5ff0e7259e51a91a5967f327e0d1e8fbca080ca1a0231589"
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
