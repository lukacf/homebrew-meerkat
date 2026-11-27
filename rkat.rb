class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.9.19"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.19/rkat-0.9.19-aarch64-apple-darwin.tar.gz"
    sha256 "5ddc1aed6e8fd0255e5081658bb7b1725c88b098bd7858f8b3782ccca571e8e6"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.19/rkat-rpc-0.9.19-aarch64-apple-darwin.tar.gz"
    sha256 "779009a20c75639afee7df08e43a314d4de901d92e4d46d3a7c9a6d252a8cf1b"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.19/rkat-rest-0.9.19-aarch64-apple-darwin.tar.gz"
    sha256 "e4c76c81c54220eabed1c76980f60f76640cc85d27083b0f511e67c5d1a5acd4"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.19/rkat-mcp-0.9.19-aarch64-apple-darwin.tar.gz"
    sha256 "f4d4fd1e5f648acd1db2283b6d7b0f7cad660306489b86a422a09ad37e056d46"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.19/rkat-0.9.19-x86_64-apple-darwin.tar.gz"
    sha256 "dea91d2fbe94623dde1c533156a32e933ee0e3abe76208aa2a31bbb132f20fcf"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.19/rkat-rpc-0.9.19-x86_64-apple-darwin.tar.gz"
    sha256 "90e534c5dc3f15b28b8766248eeca175f9a179187f351c16625040647b98bebb"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.19/rkat-rest-0.9.19-x86_64-apple-darwin.tar.gz"
    sha256 "cdfc27458c625a01c5185f950bba66ced1d8fb01b29add40b516acd91a581a99"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.19/rkat-mcp-0.9.19-x86_64-apple-darwin.tar.gz"
    sha256 "1377c53f34ccec28ac050425e34c447ed6e1bb647bc39439e52d2c915f65c4f2"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.19/rkat-0.9.19-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c8790a353a6146b0a0bfe7aca71b5a6edc4863e8ed2c69276a17642701e013b4"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.19/rkat-rpc-0.9.19-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4a4a0dfb2de99c0822a0eec878602af4283e45132e4440bf9ab3c79005d323f0"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.19/rkat-rest-0.9.19-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "765dfaab9d9b751358f00c465f6e3693dff5ace990689256e17815f8a7093504"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.19/rkat-mcp-0.9.19-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "46e38ee9854c676eff949b8e67e9d074d4d3be1a5da00fb531ca97a3dfafe646"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.19/rkat-0.9.19-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "59427370c2e6ad248dbc2ad4ff91b38de301b94d3c0b4d7b4eb3fff76390c0cc"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.19/rkat-rpc-0.9.19-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "26d538859b425ab7e421cff21c308224f7eea7e84c9c4893bd05cb808d65bc88"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.19/rkat-rest-0.9.19-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "825dd3e2423263527feb5491a96d1bcf87c2cdebc7b95c32653ed1b77e34eebc"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.19/rkat-mcp-0.9.19-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7eee6be79519e09adb115ff207c4a1805faa8b6d1941b340a1baed349e9423c4"
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
