class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.7.27"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.27/rkat-0.7.27-aarch64-apple-darwin.tar.gz"
    sha256 "9aad81c9426a16485fef057d14c19e97e7ec908f5b783ac48e085638d8bee29b"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.27/rkat-rpc-0.7.27-aarch64-apple-darwin.tar.gz"
    sha256 "629c92db764a8b16d3b7031f7574df813dd0d45a7bdb2ace28b8bb0e91db4e8b"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.27/rkat-rest-0.7.27-aarch64-apple-darwin.tar.gz"
    sha256 "fcfac42d533e314a8b86c69bcd6b952d42459a475842b4a0d79d951417746780"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.27/rkat-mcp-0.7.27-aarch64-apple-darwin.tar.gz"
    sha256 "ebf89d63ad892896eb8414184a5c8ed06507a1215762489aad5f69e60326ee94"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.27/rkat-0.7.27-x86_64-apple-darwin.tar.gz"
    sha256 "7897156b4a2969478dcc4ab3a481b63a607454ce7ebb5faf8bb4dd8ac0a151f6"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.27/rkat-rpc-0.7.27-x86_64-apple-darwin.tar.gz"
    sha256 "0db7170ec297ac649d76bac702db29bd116d50140a84120d83d604a117681d2c"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.27/rkat-rest-0.7.27-x86_64-apple-darwin.tar.gz"
    sha256 "0f2a01bdeb6fbd4b46d5907149a340bd8d0072ccd1a7a11d79af9dc7f1883ec6"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.27/rkat-mcp-0.7.27-x86_64-apple-darwin.tar.gz"
    sha256 "298e0216281adcaccaa992c8b478336f3549922ee3321ad1539ae91eb24e2e14"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.27/rkat-0.7.27-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "bb4ab3b5ab6c66d0a3b08d3dd1f4f981983890d8b4d4b6b99312669fb747e539"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.27/rkat-rpc-0.7.27-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3e42111c7d3ace40f83ffb34d6dcde44f356f23ef4c48c47a6dc8679abea4b6b"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.27/rkat-rest-0.7.27-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "617950258fabe04ee5fb89b06837c05c433c7cbcda360ab4b90db46daebf9ff9"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.27/rkat-mcp-0.7.27-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "62e9835b26d13c9cb105eb0079b312475484a23a6cd1ac80e63d745a81df964b"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.27/rkat-0.7.27-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a392bba53fa8043d4c2eab93995723a4d2ce903c6c2169e856fc29d623d2e282"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.27/rkat-rpc-0.7.27-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a42f89a41bbfd056408d6560653868d1aacc2d9c82b21a6b386f731a0e7e53e6"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.27/rkat-rest-0.7.27-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "25754f36c3009b1fe17cd6dbf59abfb719bd5d6a19f12ad4da24eada124b9e1e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.27/rkat-mcp-0.7.27-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "44a31bbf579dcb8bdc713f16ab2b637aa77c1ed6f19a9fcb7133f6f7326032be"
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
