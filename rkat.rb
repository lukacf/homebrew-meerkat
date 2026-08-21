class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.25"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.25/rkat-0.8.25-aarch64-apple-darwin.tar.gz"
    sha256 "177438e5b084eb99a1439b202c3f873fb2921c733a825980e93bc6a5e52ea1fe"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.25/rkat-rpc-0.8.25-aarch64-apple-darwin.tar.gz"
    sha256 "d6163304238915301e3736d25443c9e5517ca08e3acc5c4d309997295d3b1bda"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.25/rkat-rest-0.8.25-aarch64-apple-darwin.tar.gz"
    sha256 "81bb1af0cc54a29888b34518db9cd8664422edee6d661b1e9247fd6d39950b76"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.25/rkat-mcp-0.8.25-aarch64-apple-darwin.tar.gz"
    sha256 "1269326a0b7f40cd7ea35952b756588678c7a5ddd7098ec62acce2746c632b37"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.25/rkat-0.8.25-x86_64-apple-darwin.tar.gz"
    sha256 "9736f673adb36fadad60c29a362569e6406983df8be735dd80aa273027aa42f4"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.25/rkat-rpc-0.8.25-x86_64-apple-darwin.tar.gz"
    sha256 "f0d4048a604a30b23068a814e64692175da4e85b4be91daebb05e6fb851acc84"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.25/rkat-rest-0.8.25-x86_64-apple-darwin.tar.gz"
    sha256 "751993d65963b3dd34b10e07f08269f26b543e0ab536499f36edc939069d7206"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.25/rkat-mcp-0.8.25-x86_64-apple-darwin.tar.gz"
    sha256 "79d7f15de1fe17b469f213dc821192b26cc809f5f5a029d2119c50ba0acc115a"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.25/rkat-0.8.25-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2e87d9ab2fd9ecdf5b885744c526fe1b96a68a6328e2d0d52172b0edad0f2b52"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.25/rkat-rpc-0.8.25-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "94bc63cd227f3ed082bde7c8f1438d1808305d80c91d87520703bfcd4c1947a2"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.25/rkat-rest-0.8.25-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b39532d9a7b641698717785bf2ebef3a593dd7d5910e64f190f2b5d864ba676e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.25/rkat-mcp-0.8.25-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7b708a3df9f2527b933a753ad2e7c37dd7137b5363af6063a8fd5719187b68db"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.25/rkat-0.8.25-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6ff517cdaf9052caa242416fc6f01cc76b00e91f564302490072ec8425cf01c2"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.25/rkat-rpc-0.8.25-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2ffd5451408f7451ba260ceda4049a0df1d56e93fea7d81e8133e73b9eb8cee1"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.25/rkat-rest-0.8.25-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a14c961a9f3e1c82a4c11bcf929f477d545eb1ee82d67d5f04296738d4c810bb"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.25/rkat-mcp-0.8.25-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3f92e51a04f228a5d337e992ce4b933305b0bb67b3c624b5c4eec0ab4e9b9361"
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
