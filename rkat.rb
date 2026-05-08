class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.2"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.2/rkat-0.6.2-aarch64-apple-darwin.tar.gz"
    sha256 "4953b60356f1a21c52b17e789e858a2184a04f16c80478e4f3834eee363bc348"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.2/rkat-rpc-0.6.2-aarch64-apple-darwin.tar.gz"
    sha256 "d926989c829fefeb425ca3c75f944262df7f7bdbe875a6f8e8576b5005bdf8e9"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.2/rkat-rest-0.6.2-aarch64-apple-darwin.tar.gz"
    sha256 "31358f3d0f1a777d93e7861a29bb87b692220e6ddddfc4c5384c78e2fe0875fe"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.2/rkat-mcp-0.6.2-aarch64-apple-darwin.tar.gz"
    sha256 "b50e636e16b51a7f404d00ddcb615b1a1791e5eae16c4a825cfd19635067c957"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.2/rkat-0.6.2-x86_64-apple-darwin.tar.gz"
    sha256 "e209ce7c1463ed9987cb52441bfb1f0d2b09174b46de0e469e20f7194a4a2709"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.2/rkat-rpc-0.6.2-x86_64-apple-darwin.tar.gz"
    sha256 "9a76d1521ac6ba8b89af17b098c2746aaab36de2db6a8c55f920e3b226c270e5"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.2/rkat-rest-0.6.2-x86_64-apple-darwin.tar.gz"
    sha256 "6e3e4f5a670e0c7b51faef456b403a2737585ce87ca3cc2bbca94f7efc2d2c88"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.2/rkat-mcp-0.6.2-x86_64-apple-darwin.tar.gz"
    sha256 "248a9d3c244018b6768faa7eba766ff0683052d2d6dda84b09839deb58106bea"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.2/rkat-0.6.2-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f5eb5e749a7a462ffaaf241285a17d1dc033ea104782644fb9094bfcb976d8f2"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.2/rkat-rpc-0.6.2-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "87629c79a17188941bde6d6d1f80051eb4db2de2f31da1daab80bac8337a8eb0"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.2/rkat-rest-0.6.2-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5c6de5cbf089f5d617fa734fb98876b850de8bab5ea3975720defb5275736ae6"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.2/rkat-mcp-0.6.2-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8c507af4989888597588dc70fa81bef825b925dd73e65c57db81d866f6b9ce69"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.2/rkat-0.6.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3f9dca80096155a3d61b85ac922b7e2d703e4c23fd1c0c67bb269d97f9d875bd"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.2/rkat-rpc-0.6.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4067f8df52253607ca0865de3048d22d106ec8474db1a05a4fcd32cc4f7890eb"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.2/rkat-rest-0.6.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "60f43485a639367620b9a1d04fb2769d5dc522c6532958a665c1dd4d2cc665c7"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.2/rkat-mcp-0.6.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ffce28a711971a0c796ff6ce59a247ba3009f8f349c0ef083940b68cf16468fd"
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
