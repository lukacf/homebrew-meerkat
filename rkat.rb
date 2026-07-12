class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.7.30"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.30/rkat-0.7.30-aarch64-apple-darwin.tar.gz"
    sha256 "79bb2e70074a755b8f2698e73e13778df52a66abdbb62e8f0854af18362b1233"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.30/rkat-rpc-0.7.30-aarch64-apple-darwin.tar.gz"
    sha256 "571cd952597eaf762f95cc0b88584e1b678641f2349574ed2d54957a19ecb032"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.30/rkat-rest-0.7.30-aarch64-apple-darwin.tar.gz"
    sha256 "2d1a9c9d339e1fc7932a3e21b392b420f0e3440e36d0f91ed1ca56b06c7eae3c"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.30/rkat-mcp-0.7.30-aarch64-apple-darwin.tar.gz"
    sha256 "3cb24f2c570d14addf1713a6228f15e5c0f29e39d623b46a51c87e541fb1d8be"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.30/rkat-0.7.30-x86_64-apple-darwin.tar.gz"
    sha256 "5baf27ca28eda7c2f39a0d63b9b5dce7df0cdacf5c6c51e830df50f52873dc89"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.30/rkat-rpc-0.7.30-x86_64-apple-darwin.tar.gz"
    sha256 "fd1b441a52be4fb527089ceb7ded1586b1cb3c247ed872254d748b56762af7af"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.30/rkat-rest-0.7.30-x86_64-apple-darwin.tar.gz"
    sha256 "62ec4dd0908eb0f76d971c4042f48026e6477fdf15ddf8a94a6f92f724e8a0f4"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.30/rkat-mcp-0.7.30-x86_64-apple-darwin.tar.gz"
    sha256 "68dce943479e87106ff4bfd264335a3acac33603973473a242c1b8b55449d41b"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.30/rkat-0.7.30-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8ed51e2d626bdcf5c7c9e700dc1703d1e2a69ff4307d28328e187cdc22b4419e"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.30/rkat-rpc-0.7.30-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f89f135f8087e536a6a99452e34f23f640912592afbcb3dd4e8973f102c1afb8"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.30/rkat-rest-0.7.30-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "33955012e2231541b290d44c46f49591e1ec8051668cb4c1df02fab8d6894fcd"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.30/rkat-mcp-0.7.30-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "eeed73e74194ff713d27e2d88d19bf06330fd1212e127486e89403e325bf9088"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.30/rkat-0.7.30-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8a4eba7356112d1b067ad550cdb2737533abc9c7cacebd0852c74d1908e8b2b2"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.30/rkat-rpc-0.7.30-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "698577019e95bcda8c049c66867d05ebaf0cd06bcc2bb387cb46c045b07e7920"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.30/rkat-rest-0.7.30-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "48888c6b0605bf92f45577cccccec8e921786ffa9b03f07140a8a2b9329c7b6c"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.30/rkat-mcp-0.7.30-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "09c8cdf593f4401468c0d7bf9d8c981ad425043ef86cdfac97a11540e06ae00e"
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
