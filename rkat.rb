class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.10"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.10/rkat-0.8.10-aarch64-apple-darwin.tar.gz"
    sha256 "97501fa6bc078b344315e91981240f4b66a8d2f64c26f4575b04c74df73b5db7"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.10/rkat-rpc-0.8.10-aarch64-apple-darwin.tar.gz"
    sha256 "915edce2b10cd9ca3339af21f767d57cefb55e52e43da5d59bba691dc94108f4"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.10/rkat-rest-0.8.10-aarch64-apple-darwin.tar.gz"
    sha256 "f812e39d198789558423c82ed08913cc0f945f5f34957698eaaae1fff5b8be00"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.10/rkat-mcp-0.8.10-aarch64-apple-darwin.tar.gz"
    sha256 "230761122ae0471b8454524ef1f0d834b16fd1b44c3791fb070471896b9804df"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.10/rkat-0.8.10-x86_64-apple-darwin.tar.gz"
    sha256 "053460d7352cf1b3dba90f9372d23e51122689bc53fae451ee30d51f5c033f17"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.10/rkat-rpc-0.8.10-x86_64-apple-darwin.tar.gz"
    sha256 "ff2760e898e4c3ef1f2416d2269aba25f34032a17131fef9a50872ffeff4d7bb"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.10/rkat-rest-0.8.10-x86_64-apple-darwin.tar.gz"
    sha256 "19924e45afa5ea28f5d81a75e15f5e5e83d74a636a8e57f36cdfc6e763bf6f89"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.10/rkat-mcp-0.8.10-x86_64-apple-darwin.tar.gz"
    sha256 "da5b793d1ca55c7a789fbfe5feec08af2bf8114407cc6fab8636e66e4286d9d1"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.10/rkat-0.8.10-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2e0cf8d292103891a9dfee9199857e99b9a51eb66224cec69c31f0f9bde6b71a"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.10/rkat-rpc-0.8.10-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "874c0fef62670ad3e5673c8d41bebe1debde0552a3119f4913ca1a09b7fa0853"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.10/rkat-rest-0.8.10-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "078e02bab57892732e1b808ab3c86cafa71a1bb3ae1ac6f755b31aa48f5fd405"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.10/rkat-mcp-0.8.10-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "41fc333d11f889ce4fb6b1d9f40949ed4778c6ef708ecc019f86e510afa13d3a"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.10/rkat-0.8.10-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "913645c54ffbefcc04185294e82b549ad0462c97b1b6852900d97652bd6af4db"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.10/rkat-rpc-0.8.10-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8585675201bcaa80e39dad6b92b58635d62117ff15ad1c0162c7b38f585e2ad3"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.10/rkat-rest-0.8.10-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "343dcf100b138acbe4dbaba9018b49b85bc247154d8646d92990f47bc2b124c3"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.10/rkat-mcp-0.8.10-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "231645059f42cfbc15f56640c592f676538937586a497827ac09130bc25261f0"
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
