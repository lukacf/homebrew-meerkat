class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.43"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.43/rkat-0.8.43-aarch64-apple-darwin.tar.gz"
    sha256 "e302ba5144088ea7128362ba463c045d4809c43e82ecb20366e550141d88f66e"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.43/rkat-rpc-0.8.43-aarch64-apple-darwin.tar.gz"
    sha256 "61a40c378fc8684499bb7e199d7ddabc4c38aec9d81642b48158f1b6da722539"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.43/rkat-rest-0.8.43-aarch64-apple-darwin.tar.gz"
    sha256 "5123d2c9598351e48a0226a4bbff7c09e18a12edd17ccbae965610f34d5262fc"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.43/rkat-mcp-0.8.43-aarch64-apple-darwin.tar.gz"
    sha256 "ccf9a6feb0645f2dd7f58f381bb06a6ca88f2c038f17fb767cf9423d53acba24"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.43/rkat-0.8.43-x86_64-apple-darwin.tar.gz"
    sha256 "634bc829c682d28933dffafeece63f159e6411713840f47de5c95f0950a9d034"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.43/rkat-rpc-0.8.43-x86_64-apple-darwin.tar.gz"
    sha256 "efb88c48d5edde2ae6501fe306e24b11b4b9e608b5e1b43586959cae9832b76f"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.43/rkat-rest-0.8.43-x86_64-apple-darwin.tar.gz"
    sha256 "ecaa2e7505b17b94b24fdf1d509f3f187243327a1c7328855f594a855d8a8fd4"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.43/rkat-mcp-0.8.43-x86_64-apple-darwin.tar.gz"
    sha256 "a349c1aa1b55557bce070050840061042c2a9dbcca67c59f00f0a145084a81d3"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.43/rkat-0.8.43-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4a48dff32901acf2c22feec4fea269e3d82547753d95f6e5b953b4c513cefb1a"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.43/rkat-rpc-0.8.43-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "95d4457918421817d79b2b6b134416164b5bca3902e2d71cc8291c7e7b3ca602"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.43/rkat-rest-0.8.43-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3becfe4b46e45676cfa6b0ff028412b6904591280add63e4ae40fab274d62b15"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.43/rkat-mcp-0.8.43-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e2c7c0faef68ae2a903d6f6fa5d20e607c3ffb6c1cc88455a2a783f07932bce8"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.43/rkat-0.8.43-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "918185b3c3bdfcb75be67c70687dc3da1c66d2f8582bde4b3121d48af6f03487"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.43/rkat-rpc-0.8.43-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7c0c70cc300957e3ff3a364b3db9d6781b2b2d6e9202f4ba57d17a9f0476619d"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.43/rkat-rest-0.8.43-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7dc5251dd41c03e6f15f7a907f92ee046e2f26c1c524450d58b128717377e565"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.43/rkat-mcp-0.8.43-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ddc91ffda1d3c21d9d503a163ce3f0ed169a69e3d2780742ab1dc7a0cba25069"
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
