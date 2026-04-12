class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.5.2/rkat-0.5.2-aarch64-apple-darwin.tar.gz"
    sha256 "9eea79f90cf1102d3ae4acc7ece54742b4f1e926c208b7a754d57fc336e9fc5f"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.5.2/rkat-rpc-0.5.2-aarch64-apple-darwin.tar.gz"
    sha256 "01dfade13768ce897c35157714d4b4d7dbd9dbb1ab275543b0f2260cc306603c"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.5.2/rkat-rest-0.5.2-aarch64-apple-darwin.tar.gz"
    sha256 "b5445ce14cc2b46d4eed2ff7f8673700d645fdc30b2326c7597c1d2ab23e6827"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.5.2/rkat-mcp-0.5.2-aarch64-apple-darwin.tar.gz"
    sha256 "b68efef5c594e7a75922a20ca56e6d9cfb34d79914361105050be2419a28fd09"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.5.2/rkat-0.5.2-x86_64-apple-darwin.tar.gz"
    sha256 "7d3bebbd7241605ccc3a9dec5b900e71727770a6af5dea022d007bd0db99a45b"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.5.2/rkat-rpc-0.5.2-x86_64-apple-darwin.tar.gz"
    sha256 "c573e460aee876f9bed0705a0fa16ba51fadb86d144c34e62ca33ece38e2511c"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.5.2/rkat-rest-0.5.2-x86_64-apple-darwin.tar.gz"
    sha256 "9a9df688ae729e0da4522636b24abd8d4c31a297f324a8a071ab2a9af9fcf739"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.5.2/rkat-mcp-0.5.2-x86_64-apple-darwin.tar.gz"
    sha256 "79dd07dc2357f9a7f245a6bc81c94c50503b92980d0d6935ab88b43351e22d1e"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.5.2/rkat-0.5.2-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "51c66b72359564b2f291f0a0eac69f9f8251093d51b1d53d4b22c2d67b0860ab"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.5.2/rkat-rpc-0.5.2-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "84caef4b6a0b3352866ca72a2776095dc02eb6067f6d83abf6432749afe72ca6"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.5.2/rkat-rest-0.5.2-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f24ea53aa693bf2e51ffecfc59b57475906fbc0d9696ff09dd2e00c575edf223"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.5.2/rkat-mcp-0.5.2-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ac371fb469db51b42aeff746b33cf5dcf1d3eea01cf9a942a30cf37144a60156"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.5.2/rkat-0.5.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "def593e995cebbce98cf3f55bcbbec4f8d28013c13d053ddd69077bba8b17472"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.5.2/rkat-rpc-0.5.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1280d83730fa0a1417e408cb866f898019a6c18991f7c2445bf56a7a4ae4562a"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.5.2/rkat-rest-0.5.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "867939c7336e477d3c0f0c0face46e099eb295c27df58698a1e089410f7a9919"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.5.2/rkat-mcp-0.5.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "19d3b5e903a386093011bce75d5f15c0ddba5be8ece8710c6925564ee2453cfd"
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
