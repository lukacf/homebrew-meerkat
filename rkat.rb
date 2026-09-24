class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.42"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.42/rkat-0.8.42-aarch64-apple-darwin.tar.gz"
    sha256 "775cb7dc519cbb01787977aa08450ba04108fb5aecf13f47c77b115bbd57d0db"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.42/rkat-rpc-0.8.42-aarch64-apple-darwin.tar.gz"
    sha256 "336919df649287f8667c5e74ca65529314a30be12d6acc9f9fb07cd2a214afa8"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.42/rkat-rest-0.8.42-aarch64-apple-darwin.tar.gz"
    sha256 "27d17bd0a7f5c5802a38c7b2b97e0836b9111bd7908ffb32b0c7d5d1cf26cb9f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.42/rkat-mcp-0.8.42-aarch64-apple-darwin.tar.gz"
    sha256 "0b39f014d1e1198182f2c88dd031b7a877ea7f2b14e7d71278cbb8f245dfe38e"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.42/rkat-0.8.42-x86_64-apple-darwin.tar.gz"
    sha256 "0aaeb9385fa052215b902f06d88e71ad63e6096c08e5b8715a1fa9a29b85fc2f"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.42/rkat-rpc-0.8.42-x86_64-apple-darwin.tar.gz"
    sha256 "dd748dd3ce8b7199275866e472a4e647d1b1056beb4f32a7635da9d4d0a51eae"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.42/rkat-rest-0.8.42-x86_64-apple-darwin.tar.gz"
    sha256 "36eccf695ec14f2d74d44d6fa5905fcbcb96c123e1dd83d6ae4de48e18ba0a3a"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.42/rkat-mcp-0.8.42-x86_64-apple-darwin.tar.gz"
    sha256 "478261a4b62ec832790a96a7cffa1ab6c435a680bcae2042d9aeca88e2672f8b"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.42/rkat-0.8.42-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "cc8ab1ca0202da178f1a5d0a17bacf07f55ccb22b5c3ad8dc6b07eaae8589984"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.42/rkat-rpc-0.8.42-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "bbc8d6cb5d7de98c18015f5b5e0924299cffb592570b91f8721c6eb8bf655107"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.42/rkat-rest-0.8.42-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8ebe41b703fd80b6334a01a8c4279e656e6443e76fca62dc85e82cb7fc6ca40f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.42/rkat-mcp-0.8.42-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c8049e2ec347f60d74cb35001aa621a1ef2e660f3e7d07d118fda6a39b5a1b6f"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.42/rkat-0.8.42-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8abf76b71df61b585155fa094ac51f3a559baefbaef4eea64c5cf5557fe620dd"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.42/rkat-rpc-0.8.42-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5017f0ae29cd7480a4972443c1e60586cce00578ab3901ee17689009f0280a9d"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.42/rkat-rest-0.8.42-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b583efac677551741557933ddfeeb42ed129b89f2a4a088f88a346e75535dea0"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.42/rkat-mcp-0.8.42-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bef29c5dc7edbcd091e1398997e37261c9157a340fff7f3fbe4e1d9797d82055"
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
