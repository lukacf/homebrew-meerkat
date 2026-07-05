class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.7.16"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.16/rkat-0.7.16-aarch64-apple-darwin.tar.gz"
    sha256 "68e43a007c1ccc512899b8b37de0a57a600ee14622178a49da3cc878a4c56014"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.16/rkat-rpc-0.7.16-aarch64-apple-darwin.tar.gz"
    sha256 "9d2f8f41210dec663e3f797997b14f9540122b27b18f2393089aa1079d236294"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.16/rkat-rest-0.7.16-aarch64-apple-darwin.tar.gz"
    sha256 "c5884f19e79f6f591d3b5c535b1edb76eea8bdb3f7dff32d3c863aa936fd6d88"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.16/rkat-mcp-0.7.16-aarch64-apple-darwin.tar.gz"
    sha256 "8829c28613de852c491bb02d4f4d021fe0831bd6c448caaf166b48160a0a5e5d"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.16/rkat-0.7.16-x86_64-apple-darwin.tar.gz"
    sha256 "b62aa319c8342edcf94699b07f887ff84aefadf0677341d9ad3271c421d62454"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.16/rkat-rpc-0.7.16-x86_64-apple-darwin.tar.gz"
    sha256 "77c92b09b338a144501ea8f7427bfd57c448f14a96fc728725d2707f2a575b0d"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.16/rkat-rest-0.7.16-x86_64-apple-darwin.tar.gz"
    sha256 "560e7801ccde84c9e7154ce979be6ab76e2ff4b9f5a673cb88797b859231886f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.16/rkat-mcp-0.7.16-x86_64-apple-darwin.tar.gz"
    sha256 "24f59dceec64d0120935b8bac3af5bdd59ca841c6646a56bee0d5eb8c1e1b02a"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.16/rkat-0.7.16-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "53550e4f2f26274f2388c3bfa2bf0f14936db081c100e08fd280a6bdce25e620"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.16/rkat-rpc-0.7.16-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f6d6fc9223917daa615ad843e312ccb55b62ddae6483e4e4a48bf50dd142e55e"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.16/rkat-rest-0.7.16-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7577aa506e154b6d51c843d3c32ae34d88d05159f6687c30066c71b2744f8233"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.16/rkat-mcp-0.7.16-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7bd3ea092b5f4dd2c4386685f8098a5ee4d707ce6d18f4071d4748b49188e29d"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.16/rkat-0.7.16-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5c4aa2f94202b6e1fb629fec3f8e3de76e52ce444b837a552f2cbb0e1824650c"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.16/rkat-rpc-0.7.16-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bbca069c250ea805c7146ae927f3ff62c2b6bbdb4c2ce22a449eafee48526ddd"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.16/rkat-rest-0.7.16-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "30a17e09cc3e44d02d300e6f316fe2a5af4f5fa441b1753879630bb413ad7e8f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.16/rkat-mcp-0.7.16-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2e1f14fc0878f13c265bfc1c9dcb1f168664d225a6255e6e9aa50fe86ddbb14b"
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
