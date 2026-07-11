class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.7.28"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.28/rkat-0.7.28-aarch64-apple-darwin.tar.gz"
    sha256 "4b8c44c412f0de477c4de0393ad97d3c80b3650267f071d82ed4fa165f8a7807"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.28/rkat-rpc-0.7.28-aarch64-apple-darwin.tar.gz"
    sha256 "03fe2fd18c7a6a1d68f22159e02971a7e7190a7fee35abba2d2197f00769ed3d"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.28/rkat-rest-0.7.28-aarch64-apple-darwin.tar.gz"
    sha256 "9fc59344fcc9080032d8d02ba84c556988c85c165a6ed41e4d2c93a77c53f604"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.28/rkat-mcp-0.7.28-aarch64-apple-darwin.tar.gz"
    sha256 "d03fd3c38365d022057d54f260e8723712a6b4786a9bc802fdec2f8d78ce5b10"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.28/rkat-0.7.28-x86_64-apple-darwin.tar.gz"
    sha256 "cf2856f07adc8251734b9f232cf569374b2efd0b0d498cf26e5e6fe8847930eb"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.28/rkat-rpc-0.7.28-x86_64-apple-darwin.tar.gz"
    sha256 "d74fa10ee093ab70ee6b4a4a8bbbba43e65edef237b0298e98f2e13b0ac13088"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.28/rkat-rest-0.7.28-x86_64-apple-darwin.tar.gz"
    sha256 "6da21b2e40c68dcf6a27c040b8201953775ae1213b8c4a3005cf1e2f743e9cbc"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.28/rkat-mcp-0.7.28-x86_64-apple-darwin.tar.gz"
    sha256 "fe5abf76ed62263ad5146e4c6ca5d580aa7aac41d089d3a00bc267ac3f6ad6d5"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.28/rkat-0.7.28-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "dcb08a0b2949c391da0217fa8b298e60884f28cbea1146890a56c6ba676e4c7a"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.28/rkat-rpc-0.7.28-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b6284b32e28efcb18bddaedf262609338105cdfaade5becb7745c9308cbef623"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.28/rkat-rest-0.7.28-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b2bef8fc94dff1f6a999db4d0c82a942faac620e80917008d1e9763a6deb6fbe"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.28/rkat-mcp-0.7.28-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8e87371406c731c0bffe51b931b6e798adaeddf1f402c75e60f1a8ec836ef2cf"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.28/rkat-0.7.28-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c6f8894043cc69a4c353acdac8e463676924c14429526b3ffe559ef2957a622d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.28/rkat-rpc-0.7.28-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "12cff703ae6e6051342f702713111531a42bd17a64cf6b1bdc2ba159b61fe50f"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.28/rkat-rest-0.7.28-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b68fc910006b8451f00c9218b51b9346f74d4fa8a7529a36338d79d45b815a5a"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.28/rkat-mcp-0.7.28-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d291eecfcc45d0a3867176b890e488ad1d245e9e316ea4b225d86f14fb825207"
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
