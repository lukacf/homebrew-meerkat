class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.39"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.39/rkat-0.8.39-aarch64-apple-darwin.tar.gz"
    sha256 "47af37525127fe70a22800b95ee6cf776af5884832c415b1eec05ff1dc6ae45d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.39/rkat-rpc-0.8.39-aarch64-apple-darwin.tar.gz"
    sha256 "f9044dead8baf26c3282507f3f549387f154f1442241aa81ddeb7c9df2f6f1bd"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.39/rkat-rest-0.8.39-aarch64-apple-darwin.tar.gz"
    sha256 "39b0fda1dc4678bffdb2dbc0c066e188c64806b417e5e56426f52c0654164ee7"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.39/rkat-mcp-0.8.39-aarch64-apple-darwin.tar.gz"
    sha256 "ce7925256e91b35d0dee7c3d601053ee88d5242150d346dac7ad424de91bdbac"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.39/rkat-0.8.39-x86_64-apple-darwin.tar.gz"
    sha256 "3c87bef6e8243bfb69fd3a825b8b7b37ef9d0a497b631d03fd1121997bc5bd60"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.39/rkat-rpc-0.8.39-x86_64-apple-darwin.tar.gz"
    sha256 "78f2f0370f4255b573e8f372e87646edc501777326b886b53cf41880c4f70077"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.39/rkat-rest-0.8.39-x86_64-apple-darwin.tar.gz"
    sha256 "8dd6fac72bf54c4058b1d1e3eb302c24a828b8ececc8d70a9202def58825c3d1"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.39/rkat-mcp-0.8.39-x86_64-apple-darwin.tar.gz"
    sha256 "c2bfa26e2afc0330f40777b99fb75ec5116bb727c81375d638c0cebcc64698ca"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.39/rkat-0.8.39-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1dcd8bbd52ac79a362ea304ad6504ceb8b6f415986372bce61a3b502faa28254"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.39/rkat-rpc-0.8.39-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "271e5f49b45427c2f58c50abcd5ecfb7a242f229d82c7911555983273ea12695"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.39/rkat-rest-0.8.39-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9d6b5a928de6a240f3015936d459e31fb2fe8aab684d01ebb15cdc023a235bf1"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.39/rkat-mcp-0.8.39-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a6c4276c45f61ae764862874c66f8e6b888f8a0b9d0577c331df323f0d28a4ff"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.39/rkat-0.8.39-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5926efaf66c4208d966e57b86f79de2f4ebff119b79b1289e9a495ec34a60dd4"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.39/rkat-rpc-0.8.39-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4447b10fcd6f5261651eec819fa19bab37379b1708ec7064b12c9dc2143c73cc"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.39/rkat-rest-0.8.39-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "38befb37fb17fae4f3a349a3833b4fe3b8ea552cac32feb4e947b89ef34e7717"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.39/rkat-mcp-0.8.39-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8b1036b9cd3decc5e004914193cee70b54c1a40b94a8888398d8abf902b213ce"
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
