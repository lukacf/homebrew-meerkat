class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.47"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.47/rkat-0.8.47-aarch64-apple-darwin.tar.gz"
    sha256 "375e0e9dc955c140599471a276b30fa555c0f578db4f489fe3ae1f56cedc7c9b"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.47/rkat-rpc-0.8.47-aarch64-apple-darwin.tar.gz"
    sha256 "25716c149e8ace3dd1207bfed007189d7177b311f81e3fde2334fb4df8b711a4"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.47/rkat-rest-0.8.47-aarch64-apple-darwin.tar.gz"
    sha256 "23eaf1d8c7d3d96e1341698d1f44e1c5ca4df3d975ccc62e4d8f861caef9839f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.47/rkat-mcp-0.8.47-aarch64-apple-darwin.tar.gz"
    sha256 "9d52153a319647a789dcdf43f44f4b98a400cf0b4f381bfa401431280df808f7"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.47/rkat-0.8.47-x86_64-apple-darwin.tar.gz"
    sha256 "73dec4c58d5a2a34fe514f0f79d7475e88c03958fdc9b753c89698e86b37dd59"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.47/rkat-rpc-0.8.47-x86_64-apple-darwin.tar.gz"
    sha256 "0ad6f12b8e64a1907cce7e3438b07ab87f5fb824bbd984abf6ca096a44372762"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.47/rkat-rest-0.8.47-x86_64-apple-darwin.tar.gz"
    sha256 "64eddab72bf76c145b24381b4d89a43d886ee05bc137090fe14c0a24c54c5580"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.47/rkat-mcp-0.8.47-x86_64-apple-darwin.tar.gz"
    sha256 "6f0c1b35eddedbfec81d70886b5356167011619eb29ae2a3b9b3f8cae76b0a7f"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.47/rkat-0.8.47-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1aa3bd69040441e797f217cf81c16e0207f96e64f750e115459fa66d80a0801f"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.47/rkat-rpc-0.8.47-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "16a47c0eef5e6ff645010ffa8799dbcb2c7fce7b25d2e75b14fd7e1174581ba7"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.47/rkat-rest-0.8.47-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4d8645650856a39ad3ae96be2bfc68637668fc4ac75e5deff803960f0200766b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.47/rkat-mcp-0.8.47-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c52d89039e3b31424be53f53fa3ffa4040bf63707b04d4737c2b69fb19954892"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.47/rkat-0.8.47-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b24ac6701cd80443551abb8678119148189fc594852f2005755864539da8eb2f"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.47/rkat-rpc-0.8.47-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "dfd3e081eead05ec12ed79448dba71a2857d2891e05a1b4707a1095053748b05"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.47/rkat-rest-0.8.47-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4916c3df678df6fc10a2817830168b5d76b085e1f0b1169e9a32f4b1af7c6691"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.47/rkat-mcp-0.8.47-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6e029d9391a00023a166edd974d0ed4adce8eee7cc1e631fd39076c49114dc92"
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
