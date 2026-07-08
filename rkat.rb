class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.7.23"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.23/rkat-0.7.23-aarch64-apple-darwin.tar.gz"
    sha256 "542f91d41e8ecde82df0fd1a24f0525a96ed8461f5d87c35c25626cdba53376e"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.23/rkat-rpc-0.7.23-aarch64-apple-darwin.tar.gz"
    sha256 "4bbb825dfa6e6f1d9107551c667f0baa0a9f9ad8cb0ec8c3f78c0a85a3a38b7f"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.23/rkat-rest-0.7.23-aarch64-apple-darwin.tar.gz"
    sha256 "16e3164bc0df9136731de838331b1a0efffa1505fa0a1f1008fedbeea96caf3d"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.23/rkat-mcp-0.7.23-aarch64-apple-darwin.tar.gz"
    sha256 "15ab55da11de391bd73d0e7757ae72b5f95cb8c8199398e85ef1ec5d2fb9e0e4"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.23/rkat-0.7.23-x86_64-apple-darwin.tar.gz"
    sha256 "8a2b271e14e2cdafc8e3226a7a010423b53f902e76a2b7aed89d5259d2b57ffe"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.23/rkat-rpc-0.7.23-x86_64-apple-darwin.tar.gz"
    sha256 "7b202254fa1356f7d92048ede2aa9df86c6b34ffcf10f086e618ef60022eabf7"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.23/rkat-rest-0.7.23-x86_64-apple-darwin.tar.gz"
    sha256 "28f5fcbb5bd87b20dd020ef772575db225e34e3d861949fd5f20210e39a1c956"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.23/rkat-mcp-0.7.23-x86_64-apple-darwin.tar.gz"
    sha256 "fbf66f5d50eb2300a554a672d93d509037c32d42b83ea6d2206100b14bd6a22a"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.23/rkat-0.7.23-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "cd9b5b5cba25e49a2c561327cc39294482d2b0efde7a03370088042556db3cab"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.23/rkat-rpc-0.7.23-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "364c98cb9b1b41ea8abcc6ef59cbdbd15b9fe002389001b8cb5622a2820d0e8f"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.23/rkat-rest-0.7.23-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8fda4c95d832fefe204a826f46c100460dcbd408f9c1cb8d3404c821ddf0f9c1"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.23/rkat-mcp-0.7.23-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0584e0c4460672d91a12970da2ae05c91e6bc4025fe000802814d61d189d7a7f"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.23/rkat-0.7.23-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e3ba49c5b423d1486cdc285c16aeb16ed3bf57d350724f3de2b072ba4e26deb3"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.23/rkat-rpc-0.7.23-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8f0eb5a5ca5ca33d4e52c47687f9249c52f7148d9a2d5a1ede41ad1f4a11a7e9"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.23/rkat-rest-0.7.23-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3a47ab459627791c5447a3260e1cca65dfd94bfdcd0b80f91ca9a8200b086577"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.23/rkat-mcp-0.7.23-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8c56558eb1d1d4c9a3d5d7224e8989c77a0584bbba99196ac2c2568bb5a234ed"
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
