class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.49"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.49/rkat-0.8.49-aarch64-apple-darwin.tar.gz"
    sha256 "9f8223abce441faa85151096100a84fdb5166f6df3034e36ff4e38874ada00b2"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.49/rkat-rpc-0.8.49-aarch64-apple-darwin.tar.gz"
    sha256 "afe8334525572ce8f2cdeb766d5e74536e727be4cb0aa3cd44333057d1e5ed70"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.49/rkat-rest-0.8.49-aarch64-apple-darwin.tar.gz"
    sha256 "c1c86d896d689219f756fcf325d33b3a35b375f7680daea633f4d895aa636a82"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.49/rkat-mcp-0.8.49-aarch64-apple-darwin.tar.gz"
    sha256 "a13f0ad72a835899081359558d345773954b14ce76f11c10c4cb5f1aa6c25d83"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.49/rkat-0.8.49-x86_64-apple-darwin.tar.gz"
    sha256 "35bc52e59abf042455833bfaf750f044b8e03515ca355bad1b868ef2fa64bbb2"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.49/rkat-rpc-0.8.49-x86_64-apple-darwin.tar.gz"
    sha256 "c118d524e7822b3f95f3cbf64b1451fd6e32b89b8360d319d17192cc4d6f2fa5"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.49/rkat-rest-0.8.49-x86_64-apple-darwin.tar.gz"
    sha256 "59b811304a4de0d74e1b58baad81a3be6391058882eda3c827d10ccca9cb37a0"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.49/rkat-mcp-0.8.49-x86_64-apple-darwin.tar.gz"
    sha256 "08623dc36885bc459aecca60f2d19381c74cc828d940382e9901d0278de2157e"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.49/rkat-0.8.49-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1a655cc391c1fc42c5bc560ed0d6a04ce7dca4cdf95e0227df75c8dd93cfd134"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.49/rkat-rpc-0.8.49-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "256f9026a617ca409767b68f778d9deb3da7b097b4e00cf38e5457f2d8f663d1"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.49/rkat-rest-0.8.49-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f6ccb12d8465ed4e46d9fa87a8fd21971f169a1058d2a27395572d42b77293e2"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.49/rkat-mcp-0.8.49-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "aa7e3a39aa35ca1d08a9ed231ddd4502427015d6804e520ff7e7d35c239f3e3d"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.49/rkat-0.8.49-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "58661e3c9115b926fafa0fb27f8af6d7cd4dd9278e118c0d8c74e83fff05b420"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.49/rkat-rpc-0.8.49-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "816c7eac528cd59fee99495818ce04fd783d69cc29e4adf720a781b854e6024d"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.49/rkat-rest-0.8.49-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "dbdb1a1ccd4eb52ea397c071bd30736332b750b78a950a2f39a42c6b8d5f9911"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.49/rkat-mcp-0.8.49-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c400055689af0cecdc37c9c3d2c0bd0279f6e25ee700a2917a7ddc50ae2b61b9"
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
