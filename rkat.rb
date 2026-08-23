class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.26"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.26/rkat-0.8.26-aarch64-apple-darwin.tar.gz"
    sha256 "ca90101a5a5ee40bc8b93e49ebc2ece7f00ab47456edc09f7c2ee961f224dbad"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.26/rkat-rpc-0.8.26-aarch64-apple-darwin.tar.gz"
    sha256 "95c1b05806e784e41fe28e02da7c2dd2464ea73d86ca96cde463505cb0112388"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.26/rkat-rest-0.8.26-aarch64-apple-darwin.tar.gz"
    sha256 "8ccde37a36763a80348c8b2b665573746c82bbeedda64793446a97a8a613c251"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.26/rkat-mcp-0.8.26-aarch64-apple-darwin.tar.gz"
    sha256 "1c6d2e9923f476348590d004654f095899752fb298220dcfbc9cb1137c9c948d"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.26/rkat-0.8.26-x86_64-apple-darwin.tar.gz"
    sha256 "3d3daf091b630543910248695b9b0d25c95f5c55bd01309800d0369937a1e5b4"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.26/rkat-rpc-0.8.26-x86_64-apple-darwin.tar.gz"
    sha256 "55e686f944fd6138277be532a93caa59d1f87a76eca06e97d159fd0aa9db5e21"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.26/rkat-rest-0.8.26-x86_64-apple-darwin.tar.gz"
    sha256 "0e4a3b14ca7a9a7933921426c3d951b264267cc82b9921543dcc73d3a10d0af0"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.26/rkat-mcp-0.8.26-x86_64-apple-darwin.tar.gz"
    sha256 "09b707c2b4ea77afb9965f015c7da4612466bcf96ef865de57aa481028fe31ef"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.26/rkat-0.8.26-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3998c6433f68a7a2b6e8c1258bee35ce43ce02264bf758d4e23408a569c2ef09"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.26/rkat-rpc-0.8.26-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d8bc146fbff5a2b871acdc45a271a04c351236ba622a6056a47ca6ffdb2e4f88"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.26/rkat-rest-0.8.26-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "99592da48617fb240d4a93b84939941c3497c68d2991037df497e289ab1e985b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.26/rkat-mcp-0.8.26-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b6d1ba429662a72da4996bb1798897d995c52aac945750c036378b99f5f2ace0"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.26/rkat-0.8.26-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "675ac61e0ea2243bec7bab94e95d884efb7cfdc3fa2f0d71151298ae6d2d6f17"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.26/rkat-rpc-0.8.26-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a76120269c24937aa62920f7177fc7916fba7a9fdb0a23868396ff3ad14f7fae"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.26/rkat-rest-0.8.26-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "069b4f8ce4ef947219e7423158acdf212eb5df3adfe6e09ebcaf98119a1814d7"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.26/rkat-mcp-0.8.26-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1c8ef64e878b2d98d7dc11e052a3ac9a534114afcad01f6f0009f0766bd06072"
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
