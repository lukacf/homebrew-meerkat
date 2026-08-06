class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.18"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.18/rkat-0.8.18-aarch64-apple-darwin.tar.gz"
    sha256 "6aa7e14c439b44a4fa6c3af99ce336e05bd858e14612735189534ac4c700f4b0"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.18/rkat-rpc-0.8.18-aarch64-apple-darwin.tar.gz"
    sha256 "6be7f43a0672ec02432d820c836122b83e96c06b7433b084392708e9c524319d"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.18/rkat-rest-0.8.18-aarch64-apple-darwin.tar.gz"
    sha256 "f9625ef3f853d554b2d9bb88454914bad071757b1d209e28f95c7a95b56e9a06"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.18/rkat-mcp-0.8.18-aarch64-apple-darwin.tar.gz"
    sha256 "637de038e30350772f9eaba5038577dc9cd4c72609a20019e184ab4a5d9d9624"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.18/rkat-0.8.18-x86_64-apple-darwin.tar.gz"
    sha256 "76caf5aa654f26d87a495491bf9ca43cb1eb8f845baca16d6fa852d77796e548"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.18/rkat-rpc-0.8.18-x86_64-apple-darwin.tar.gz"
    sha256 "11f8ad608a046e5e4f46c1d231fea6583e646e06b63c0ab4782cc9b3b1132556"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.18/rkat-rest-0.8.18-x86_64-apple-darwin.tar.gz"
    sha256 "8da0cdf7414e1b892ff7e672286a5f44687eb8ce89771c6e649b956cf7948918"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.18/rkat-mcp-0.8.18-x86_64-apple-darwin.tar.gz"
    sha256 "999f28f5db0ebb68167533fd1e74ee28547adb293874e39fbc2f71152d6a7440"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.18/rkat-0.8.18-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c3ea1c118b0380be2bd18dc63a7a114e85abff825fd2dc5bc60dccc642b185b5"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.18/rkat-rpc-0.8.18-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c24ceb3fd57b5894f969dd45b93f174308a9d7520f22e7b8fa0155ee872c0e29"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.18/rkat-rest-0.8.18-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9acc5139504b30a8c4dba29b906ea630f8fe13524d2caeba6ccb5a7ef25323b1"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.18/rkat-mcp-0.8.18-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7e6f20164ea0fed268d127ba350cdd18de996f3568cd85009d63c1a16ffd66fb"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.18/rkat-0.8.18-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1e1de39da94e6a392958f0323013f26192243392b0d7ece0bde823a0601e918e"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.18/rkat-rpc-0.8.18-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "75eb129691982b8c683a4b49bf5638f6649f9284bd0dd94c1b6f189c39953ded"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.18/rkat-rest-0.8.18-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "73272ab64520e9a3ce1d4843238bb54c41ec4044a257e4d964099c470320fa62"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.18/rkat-mcp-0.8.18-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6755e0a1fd564240a3502f4ebf44ec467e3a07a9a41487fc6f787cc8c204ba39"
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
