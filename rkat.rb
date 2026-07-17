class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.0/rkat-0.8.0-aarch64-apple-darwin.tar.gz"
    sha256 "c0d99a3b5e23051c3cb7e6f0d5324bb2105a757aaa263458e5a0d264b929cc7a"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.0/rkat-rpc-0.8.0-aarch64-apple-darwin.tar.gz"
    sha256 "9ca263b312a9936af92b8835f9c347e5f1007ac88c96aa542afe2d6d61cf2fd1"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.0/rkat-rest-0.8.0-aarch64-apple-darwin.tar.gz"
    sha256 "a7ed0b37b52da067779563e55750ec4093f4ce064b144855524b0340ee89ba47"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.0/rkat-mcp-0.8.0-aarch64-apple-darwin.tar.gz"
    sha256 "9bb09d69b5fad9e9bc4e18ff71953e720a5bd99c81d2630024bdd105594ae315"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.0/rkat-0.8.0-x86_64-apple-darwin.tar.gz"
    sha256 "e7a43a0b395d16563993caf24dd2c3dc8ffed729ec99ad06e32a4fec76897661"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.0/rkat-rpc-0.8.0-x86_64-apple-darwin.tar.gz"
    sha256 "0c015ef2bdd48f4887c7c521fb184122dfab5387017595ea8938baddcdd523d5"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.0/rkat-rest-0.8.0-x86_64-apple-darwin.tar.gz"
    sha256 "a5904ca49b75e202c8a9f15c1d99303bf65bb95b6844341d95ad288002b3023d"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.0/rkat-mcp-0.8.0-x86_64-apple-darwin.tar.gz"
    sha256 "614ba5e90713f6b81c76585c818b58ea2502860afcd95c7e4d899571a2da095e"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.0/rkat-0.8.0-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "889538459ac1bf3de736435106c237063b77c627f9c907a3c531f48822ed0767"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.0/rkat-rpc-0.8.0-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5907fec3ee1f219d685da3e54fc4d6fa87647ff29c5e7a9a916225052d9deec1"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.0/rkat-rest-0.8.0-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "674b7bbc1b86fbf5a8d65997e79e3298e6dd5102725a5ef082bc16a080440903"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.0/rkat-mcp-0.8.0-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f20f28eaa9fbe8f4fbd354ec4fc49f481c02ad730706d9001896accd70ccce1a"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.0/rkat-0.8.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "efba690cd3b7328cd1f4f0a8bb6f90a50397ced76b1860fd433d170f08c972ee"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.0/rkat-rpc-0.8.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "54a3e5c12513f0bd662b4c3afd0812c2131d2141b3a15f3a60a643011430a2a9"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.0/rkat-rest-0.8.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6233bf0cdafb568b91c206f4b3144d6538ede3e64ad74eafc32e43950b6f34d9"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.0/rkat-mcp-0.8.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "316a4999a8f738c68c55eeefdc752caf8e5554dca79d173e61bb66380477ff3c"
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
