class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.8"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.8/rkat-0.8.8-aarch64-apple-darwin.tar.gz"
    sha256 "b8e3d1866f85f1cd37977e47cf67b380492e60a2032304bcab733870c4323ea9"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.8/rkat-rpc-0.8.8-aarch64-apple-darwin.tar.gz"
    sha256 "f07d1e85afdbe51d949edb656f8e9f8164987de947541222b47adefe5cc02eb0"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.8/rkat-rest-0.8.8-aarch64-apple-darwin.tar.gz"
    sha256 "335907bbd28a9e457a6e67786573487005b3aef2d6f709d0919bd85cbf604f34"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.8/rkat-mcp-0.8.8-aarch64-apple-darwin.tar.gz"
    sha256 "0f0d9d962b9966db52a6fe641e43043a8d36c832a518eb6d4bb98990db7714f5"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.8/rkat-0.8.8-x86_64-apple-darwin.tar.gz"
    sha256 "663628fbddd232b341d867f4fa6d54c42829731bbe259ae9f2f842fef36ac9e5"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.8/rkat-rpc-0.8.8-x86_64-apple-darwin.tar.gz"
    sha256 "7e6b939780947aa548c4efb0db107e929d9e62d6ebfd4254de429854818c5746"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.8/rkat-rest-0.8.8-x86_64-apple-darwin.tar.gz"
    sha256 "8e668234122f53b69bf5a0ef68f307eeeee5847b4ce710223b737c66b7c285cf"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.8/rkat-mcp-0.8.8-x86_64-apple-darwin.tar.gz"
    sha256 "1d71c9efb90601a8ff1813994a93b99467e460659417a5e2036263ec36ffbe4e"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.8/rkat-0.8.8-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a63f7d738519c2d763172165fb860a23ffc258d52c858ef3bf5bede9094299e4"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.8/rkat-rpc-0.8.8-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "36bdcff1e2f2cc51f753dff7efc1ce446ba5b1966800c695e427d6ac0542c963"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.8/rkat-rest-0.8.8-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "be3371154e0cdf862ca753e6e492daf2e0f620ec3ce52385c7ccc9d81dbcd124"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.8/rkat-mcp-0.8.8-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f02117bbc8507039b2f51e3a3d0bffa951fc22dab50ccb632b8758229c6a8d5d"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.8/rkat-0.8.8-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "311f8f6a807650d2bb7dec277b4c5a09fdf36d3537d3e2c129b1f54d6ef3d0e9"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.8/rkat-rpc-0.8.8-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6b26009e28dec1df3a539292995cecc7553703defb51746626a68cc8f4d4b90b"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.8/rkat-rest-0.8.8-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "987f27129cd0a6a0855f8a0ee1ecaca67720bfe1c7b67ebb839a3597cac78ebd"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.8/rkat-mcp-0.8.8-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "89712fc75f9984285189f03c49a959f9f5e5e4000e663ecfdc90a309482f65f7"
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
