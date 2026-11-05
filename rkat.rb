class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.9.10"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.10/rkat-0.9.10-aarch64-apple-darwin.tar.gz"
    sha256 "997d10e7d8d640738ca887dd456a63a80042861024feec1ea8f6cd9c9d00b7a3"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.10/rkat-rpc-0.9.10-aarch64-apple-darwin.tar.gz"
    sha256 "54ab4b143236346a2670e0a9f8ea188c81dede232a5e5ec2f96c3995fecbf781"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.10/rkat-rest-0.9.10-aarch64-apple-darwin.tar.gz"
    sha256 "1746c5ad11bd2057b14a2aa0d08157d997b248b36f2135156c1313f5afd820be"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.10/rkat-mcp-0.9.10-aarch64-apple-darwin.tar.gz"
    sha256 "1925e2fc6d47b58041add93de37163ad290074e325284ff8a6516d584ba1f15b"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.10/rkat-0.9.10-x86_64-apple-darwin.tar.gz"
    sha256 "097e7ec7edf4d8d4cfa3b8ad06b6d449d2c51e63154432263f42480976859c04"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.10/rkat-rpc-0.9.10-x86_64-apple-darwin.tar.gz"
    sha256 "b9d3b519e0ae7c7906852176f1a3c2a07776f21ba3c5671d95ce09a3237d3336"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.10/rkat-rest-0.9.10-x86_64-apple-darwin.tar.gz"
    sha256 "5170d1149a79c4cee16f54c58d8fe4040201ce27e9df374246709def0187b9f3"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.10/rkat-mcp-0.9.10-x86_64-apple-darwin.tar.gz"
    sha256 "e99ba3e1fbe36c7d3ba6dcb61ad8d059ed3fd46eeaff975ca287369f73f1c529"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.10/rkat-0.9.10-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "df7bd5311c8ecdc8158323fa513405263df6ff215ca7d305962604395bf7b246"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.10/rkat-rpc-0.9.10-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "025b47b33649e6bc90caec522c699ccc4ae5787be344592ea07d7c744ea81d30"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.10/rkat-rest-0.9.10-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2ff55f9738d21600e813d8646e75ceee3003949f5df6db68bc91c9161ffb79eb"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.10/rkat-mcp-0.9.10-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "17a96c36b8eb4049c76f320daf3e93a9d2959461e65c9a4bee3cfbcee34eb399"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.10/rkat-0.9.10-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0c057146563e4c6a96d243e5a78da4e8f8b5d228204aa05c2690d5fb24c1164e"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.10/rkat-rpc-0.9.10-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c68ae2f4a25b8f2112c7d9ef7a36679399791c84f6e91f71cbaf9edb51645bc8"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.10/rkat-rest-0.9.10-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1495548438a61f0e79b676c7ec0220c668b78d29ceea2c4474e4d68f4c0ba9a7"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.10/rkat-mcp-0.9.10-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "499c1db1059cb09ab5e103c33a89e201d5527908e1f507146708913d7e81b7a3"
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
