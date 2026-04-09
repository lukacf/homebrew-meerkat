class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lukacf/meerkat/releases/download/v0.5.1/rkat-0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "37ffd3bf44adcdf92aad901676135d2aa0552692d2a6b251bb3c8ebeda121008"

      resource "rkat-rpc" do
        url "https://github.com/lukacf/meerkat/releases/download/v0.5.1/rkat-rpc-0.5.1-aarch64-apple-darwin.tar.gz"
        sha256 "a44fae5458e278fe51eb9816db20cbe6a6d3d25d0e458473740fb81929adc56e"
      end

      resource "rkat-rest" do
        url "https://github.com/lukacf/meerkat/releases/download/v0.5.1/rkat-rest-0.5.1-aarch64-apple-darwin.tar.gz"
        sha256 "b9d0b398b845f546e319dce6150c0122e38e2266c8e835df59b00b0bbda2473d"
      end

      resource "rkat-mcp" do
        url "https://github.com/lukacf/meerkat/releases/download/v0.5.1/rkat-mcp-0.5.1-aarch64-apple-darwin.tar.gz"
        sha256 "afd4fa002de636a777b60f68fc94045514c299b7e4e533b546d2eda1b9162bff"
      end
    end

    on_intel do
      url "https://github.com/lukacf/meerkat/releases/download/v0.5.1/rkat-0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "5c95d922f7987ac6661e325b36c77d830bc7691359d40d3000d3082f3f4f4fe8"

      resource "rkat-rpc" do
        url "https://github.com/lukacf/meerkat/releases/download/v0.5.1/rkat-rpc-0.5.1-x86_64-apple-darwin.tar.gz"
        sha256 "fed47ca54132152e73262a2c9e9a189e8f4b59436115c51b294059b20343916b"
      end

      resource "rkat-rest" do
        url "https://github.com/lukacf/meerkat/releases/download/v0.5.1/rkat-rest-0.5.1-x86_64-apple-darwin.tar.gz"
        sha256 "aac4067e666302428bdba8dd256de6f0b3b15b7a9d14ba1b85980b20285a6551"
      end

      resource "rkat-mcp" do
        url "https://github.com/lukacf/meerkat/releases/download/v0.5.1/rkat-mcp-0.5.1-x86_64-apple-darwin.tar.gz"
        sha256 "ae86b02a0ebb06eb2f267c9eb6633a026f8759e5bf566d59657b11ad7c27fe8e"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lukacf/meerkat/releases/download/v0.5.1/rkat-0.5.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "59a588ac56adc1040d7d0aac117f3c3125fc7934db66c093ed052eb1144690ac"

      resource "rkat-rpc" do
        url "https://github.com/lukacf/meerkat/releases/download/v0.5.1/rkat-rpc-0.5.1-aarch64-unknown-linux-gnu.tar.gz"
        sha256 "1b6fa79b515e4d31cc210bd5b8e1b1de820dd1fadc2adce3571096ba102ae28f"
      end

      resource "rkat-rest" do
        url "https://github.com/lukacf/meerkat/releases/download/v0.5.1/rkat-rest-0.5.1-aarch64-unknown-linux-gnu.tar.gz"
        sha256 "c32208b8f26186107c2399ede1b1ba6b0ef84d6ec9d6ab127e02989a16d0ea81"
      end

      resource "rkat-mcp" do
        url "https://github.com/lukacf/meerkat/releases/download/v0.5.1/rkat-mcp-0.5.1-aarch64-unknown-linux-gnu.tar.gz"
        sha256 "abbe26081e0075ec47ce5ff2a94732e019abfc1a6f1917fbe14246787d63aa49"
      end
    end

    on_intel do
      url "https://github.com/lukacf/meerkat/releases/download/v0.5.1/rkat-0.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8e8a6919c72baa8c48edb1f80f3f47954fa73c85ba2b5854d8c6d6613d85f5f9"

      resource "rkat-rpc" do
        url "https://github.com/lukacf/meerkat/releases/download/v0.5.1/rkat-rpc-0.5.1-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "8ae2fe74759c8765bbd7bc2aa215eb3cff62f8709e5308da209f68d43bb94495"
      end

      resource "rkat-rest" do
        url "https://github.com/lukacf/meerkat/releases/download/v0.5.1/rkat-rest-0.5.1-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "01ed53d32a10b2bcbe53cb31feeb44475145c921f2db90ed083a120a51e16011"
      end

      resource "rkat-mcp" do
        url "https://github.com/lukacf/meerkat/releases/download/v0.5.1/rkat-mcp-0.5.1-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "df140a4fd8405c2e1add4624e32292df9481936908f1191ca0f666eb17e13020"
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
