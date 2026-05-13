class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.8"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.8/rkat-0.6.8-aarch64-apple-darwin.tar.gz"
    sha256 "ce26b6442062da05d783c578508cad6e18e74127ed96f0c9d47e593e6338f5e4"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.8/rkat-rpc-0.6.8-aarch64-apple-darwin.tar.gz"
    sha256 "d0d98fdf98a55c834343693711deb863d9abb515fc9ef201744b7ea32d8a3674"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.8/rkat-rest-0.6.8-aarch64-apple-darwin.tar.gz"
    sha256 "f462e5191f96b6746a92b043d18fa379fa52229a2eef021f921f59893ca3fc50"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.8/rkat-mcp-0.6.8-aarch64-apple-darwin.tar.gz"
    sha256 "39a1c866bd410290f19e35171782e622fe0f2c017cdb54713864886447f51763"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.8/rkat-0.6.8-x86_64-apple-darwin.tar.gz"
    sha256 "274bcd55efa8aa222c8f98d3fb5cbb3e08f746d6d11453e4ca0f6ddd0ecd9c19"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.8/rkat-rpc-0.6.8-x86_64-apple-darwin.tar.gz"
    sha256 "096ca8818684a75085d5810c91d644e42a3fcd746c7a2c178bc9fc8e2f8a4ed0"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.8/rkat-rest-0.6.8-x86_64-apple-darwin.tar.gz"
    sha256 "70c2af957bfbe3ff15de815b028c0c3e21b6acf8d0ddd3667560715eccca6267"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.8/rkat-mcp-0.6.8-x86_64-apple-darwin.tar.gz"
    sha256 "03c4d4b6080c4bf086838bed1dd447132f3a7cd74678554cd5c3e9370f00f8a4"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.8/rkat-0.6.8-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "68fa8d6f4b5eb50a160fab6af6ec3132c0aa099ef3ae9ff8288f6703380e250a"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.8/rkat-rpc-0.6.8-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "69abb8d80e7db11e4ea1edd412e414b6f25365c4f37dfdebdcaf8d84e7bce38e"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.8/rkat-rest-0.6.8-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "60ce9f145369999401b071c0a05498b9aeccaed6af9fbb4726fe489c286d03e4"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.8/rkat-mcp-0.6.8-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c99816ddff4aeb598e26fb19f09f8736040e26e7286b04a97f421042e2245780"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.8/rkat-0.6.8-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d2f37014fe20d95cf22abc73c2c50e241a102642476635dac8e55945caecc3c4"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.8/rkat-rpc-0.6.8-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cafd01fccff5f27620a790a79d4ee61f04e3509c7070f27347f070947420bf8c"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.8/rkat-rest-0.6.8-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "54a963514a78f0531b2b97b198887ece3a3b9134af7a15f8d33dd861a3cbded0"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.8/rkat-mcp-0.6.8-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ae44ccf025f392f4e1e440b3a285f1e0b1340e9d0a8d9bd6bab3258e08b715cd"
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
