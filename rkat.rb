class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.9.13"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.13/rkat-0.9.13-aarch64-apple-darwin.tar.gz"
    sha256 "65f93408b4ec7e21153ad82c7b8c0344c31f7ced7428c3075aecd435f94a2773"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.13/rkat-rpc-0.9.13-aarch64-apple-darwin.tar.gz"
    sha256 "b66ff87e74df5d175afb51e7ae73706b3f4f33723de8592cf4975cbf6a77880d"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.13/rkat-rest-0.9.13-aarch64-apple-darwin.tar.gz"
    sha256 "138c412f383197d77f55da6ed3eec7aa08fa26c50f00fdda45ffadfbd0763a25"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.13/rkat-mcp-0.9.13-aarch64-apple-darwin.tar.gz"
    sha256 "fdb1ab842c1cf95a3d23303c22c39a8e1c4fe050b5bda117fe320b8bff1a3390"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.13/rkat-0.9.13-x86_64-apple-darwin.tar.gz"
    sha256 "c97c2789d98aa3d885cc5805c9b7c0775b9f6a7997ca87ff022dcb1021d9137a"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.13/rkat-rpc-0.9.13-x86_64-apple-darwin.tar.gz"
    sha256 "abe962c79321503d4036212630b495b7a2d48b03504a6ceef031da50c6552e80"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.13/rkat-rest-0.9.13-x86_64-apple-darwin.tar.gz"
    sha256 "b0ae6278f19ddd1cd68ca65dbe9b747f7af98667fbc2169f167fab28ec865869"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.13/rkat-mcp-0.9.13-x86_64-apple-darwin.tar.gz"
    sha256 "6904e39eec1a96af7c9b0d08e0eabe341d84d50dc5d977502aa238c6a39e3a58"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.13/rkat-0.9.13-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "215f08dd8ecf70ed6ef6e3c23c7109644c6e353637dcac568880553c5e99803d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.13/rkat-rpc-0.9.13-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "abb6e04296ee264f0638b21ae113dbd6a1a87ed6243675e77da2dc0f541fa1a5"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.13/rkat-rest-0.9.13-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f0eddb09753345b035dad88f44228cc2920ce3ddf359864d3295cdf688063b5d"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.13/rkat-mcp-0.9.13-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "71bb23b2f310b722b4076ec6e92d8279ad4ae3aa9f8e632739499564f1f86826"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.13/rkat-0.9.13-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9679949256ac86c1d97e56656e5f6cc042d63c1b12d1fd06e92904ea8bee45b2"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.13/rkat-rpc-0.9.13-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "200fcf9ba484e2cf9f63ac36b54d084bc641141cbe4c1c7cf6d747e9ddfb5aea"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.13/rkat-rest-0.9.13-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b1f5ccd5938aedce307945de334efb61925bcb105c00c0c8f3ff60d8baf51e37"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.13/rkat-mcp-0.9.13-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3c478aaf601b2fb2b561dd5341150af54432ca8d68eae1b3577dd06ca75b5378"
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
