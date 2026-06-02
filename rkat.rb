class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.32"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.32/rkat-0.6.32-aarch64-apple-darwin.tar.gz"
    sha256 "3393c4ae34b870b58b222fefc2dbae57185729b226c82098946027bb37396bb0"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.32/rkat-rpc-0.6.32-aarch64-apple-darwin.tar.gz"
    sha256 "ce3c566998df65b8c03208ee5b101b93d5711612da2486d37a3a9d85426692d0"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.32/rkat-rest-0.6.32-aarch64-apple-darwin.tar.gz"
    sha256 "683fb78fe6d781db22f4770717ba45e33c782a47cd8fb68b84e6dab367b1725e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.32/rkat-mcp-0.6.32-aarch64-apple-darwin.tar.gz"
    sha256 "c6d94ecc937c992dce1aa53b396b11d1bb980f0831407a4e387d0c56d6e10657"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.32/rkat-0.6.32-x86_64-apple-darwin.tar.gz"
    sha256 "afc4c7fa541990433b65c15b5bb429fbc47699c40f2d8aa3d4054ff5c2fd4e0f"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.32/rkat-rpc-0.6.32-x86_64-apple-darwin.tar.gz"
    sha256 "fa5f72635896f12759b55d3075420e6fccf6af1f9cea25a85b7988ece250b71a"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.32/rkat-rest-0.6.32-x86_64-apple-darwin.tar.gz"
    sha256 "f2bf716d503b792def49cd00b2f4fb44314907e8a3af0f6b18d36e98d1d3b7bc"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.32/rkat-mcp-0.6.32-x86_64-apple-darwin.tar.gz"
    sha256 "a61184bd32dc561947cd3af83056c08617a97a201c69168d4cdf30cb2a278ae6"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.32/rkat-0.6.32-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b64e1202bb81c128e47b23e1311ed16adc7d63ee106377d1f1bdd93a54df2aeb"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.32/rkat-rpc-0.6.32-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4d80784fb13b127e19a4c1e2eaf5ad5a0d4309f415ffd11edddeb5d1ff59d396"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.32/rkat-rest-0.6.32-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "430aeba63dc9abe9bf6bbddb6dcb54765cb37d028773b57e8563f61af6b2518e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.32/rkat-mcp-0.6.32-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8aa3c1ac77f281ec7eb1d83b9b54f1b69e419dba21dfd59ff72311b5ed34b98f"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.32/rkat-0.6.32-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5bbb63ed5205312b88806c129b23a9bc7cc2fcd6b4c3e29685790952d76a0434"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.32/rkat-rpc-0.6.32-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6b49caf7896695c1b344c62cc5ca381fd95742b9fe5f84a2485bd88bd7f769d0"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.32/rkat-rest-0.6.32-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2d04fc20bdfa22951e319fb428773c22904cdc1a43563dbbbeac9cc7bb33dff0"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.32/rkat-mcp-0.6.32-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3c6a066680b5a3ccc5870c42656201d4aaa5c309415832b94aca959f7025b686"
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
