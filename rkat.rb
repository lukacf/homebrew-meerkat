class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.2"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.2/rkat-0.8.2-aarch64-apple-darwin.tar.gz"
    sha256 "277de919addf76884ac8c827e33445a82411a186ff535f7d9aced672b9a80ca1"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.2/rkat-rpc-0.8.2-aarch64-apple-darwin.tar.gz"
    sha256 "27dc8293f63b147f228328acb5426ae1fe0ddd1724d7617f793f9474d5b82254"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.2/rkat-rest-0.8.2-aarch64-apple-darwin.tar.gz"
    sha256 "e0eaa160f1b0b61800688ff3f9b9084ea73f0cb337a99ef26490c4d3a43e9776"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.2/rkat-mcp-0.8.2-aarch64-apple-darwin.tar.gz"
    sha256 "01b1046e47a24daab5ccad9113c312e1b500ea7d64d3d7974d0b5062c43c142d"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.2/rkat-0.8.2-x86_64-apple-darwin.tar.gz"
    sha256 "05fdf2c1c7b84b8619875cc368c20d789e6712db417f153c2c0bc934000cb72e"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.2/rkat-rpc-0.8.2-x86_64-apple-darwin.tar.gz"
    sha256 "04039d81fc1944752f743f019a2db212532c43ea418718c10b7d5d4017f360ac"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.2/rkat-rest-0.8.2-x86_64-apple-darwin.tar.gz"
    sha256 "5f961bd3a0b023ef6d90f006e4c5fcb7b829c43d9ad66da5265425c756f886e5"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.2/rkat-mcp-0.8.2-x86_64-apple-darwin.tar.gz"
    sha256 "3f5262cb2789c765bed8d70b112c6e8cc83c89015d73b22c2cf2f7a9301fa05a"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.2/rkat-0.8.2-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8e89c42054a86e63fa7bde4b0a9f12691457028158c1066a4d9188369d16d078"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.2/rkat-rpc-0.8.2-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a5d7c06438ae0e2b788bbe9722f09cae3e3489073aeebb0c19ac3cf4710376db"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.2/rkat-rest-0.8.2-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2ef3e04a3a412d827060b43b54b3d187ea57b037e46684e815383f36270a8d35"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.2/rkat-mcp-0.8.2-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "631990e42d700dc855477b7c1cee27e1973afc136c1eb0940b17fb7dadb51ad4"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.2/rkat-0.8.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0404adc81fcd6f70460b92a648c71fe8bd456437c319b93c18a6853ad750a600"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.2/rkat-rpc-0.8.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cb8b2cfa78ab3f0988b36bdb45de7c0c491dd90e7261cf3690bbd411e2944c3e"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.2/rkat-rest-0.8.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "513e02cc010b43519c35cc7229cd80abb73f7aa422f9017ca906bbff6a5322dc"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.2/rkat-mcp-0.8.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "eaa984b2a7357b852c84c7da25701802631154958b3255346054d212eda63308"
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
