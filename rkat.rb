class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.9.9"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.9/rkat-0.9.9-aarch64-apple-darwin.tar.gz"
    sha256 "1679a598b74922d44e62bd7f4d511967fdedda6f97d62b8ff42b3ec733ae5487"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.9/rkat-rpc-0.9.9-aarch64-apple-darwin.tar.gz"
    sha256 "2fb14c6baf01c4cbad1f89c0ee7b92510708beccd45dbc34db9989b579b59cbf"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.9/rkat-rest-0.9.9-aarch64-apple-darwin.tar.gz"
    sha256 "f21ab0d0d78d336218169779352bc71c44b1335d76080980298a31c7a6934d2d"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.9/rkat-mcp-0.9.9-aarch64-apple-darwin.tar.gz"
    sha256 "b7f494fea8b73d864f1a35dc33ff87d7bf3e095d5db916234d9e2f8605143b59"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.9/rkat-0.9.9-x86_64-apple-darwin.tar.gz"
    sha256 "f7e69d1f7a3ac01b35b7ba6467be61819e4650e9454c159020adad5411067e73"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.9/rkat-rpc-0.9.9-x86_64-apple-darwin.tar.gz"
    sha256 "88371303e451a9255d7b65457c41b799b7d3575e68bc8dafe4691496d276d4e4"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.9/rkat-rest-0.9.9-x86_64-apple-darwin.tar.gz"
    sha256 "7130d4bebb2487ef9f5276f1fec082b78e56b9472126408e3b82505d67c9f114"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.9/rkat-mcp-0.9.9-x86_64-apple-darwin.tar.gz"
    sha256 "f1c26d10371aa829ad94430f557f754799fd666c648c98b5223bd6ba3b09bbf1"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.9/rkat-0.9.9-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "240f10b31ef5d6f80a0756169bdbaf15522f5e5cd06c7879287085d2f5abeb9f"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.9/rkat-rpc-0.9.9-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7ca334577c6ca9c75e050cc6156d759acfb8a68d35f27159726f8afaf9a0cbc3"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.9/rkat-rest-0.9.9-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "195d739052f32589df0a8d7cb61cb2a4a0ba95c8532b48e7993fd16d5e41071b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.9/rkat-mcp-0.9.9-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b6503cc5f19778c14c20be64c91ab72d25b815992d6f4f9669e68daecbb14794"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.9/rkat-0.9.9-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "efa63bd2f9fed2e952a4370b436184a4cf54f69a88c1e6d5a05982d977a35cb2"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.9/rkat-rpc-0.9.9-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "02996b5926ff68819a1209379b4686eaef48c3657f7468d74ccdb8af10d80841"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.9/rkat-rest-0.9.9-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f6d1f55910c1ed58c341df207f95f1e764e481c2ab5783ce983e52998a6f424d"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.9/rkat-mcp-0.9.9-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "007ebc54fbe8d1b002745e014b03d9552940d7059e1d2a6ed38f9e84139feba8"
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
