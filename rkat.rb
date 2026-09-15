class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.38"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.38/rkat-0.8.38-aarch64-apple-darwin.tar.gz"
    sha256 "c5e1e1b7e1f1085327ac21861f4d3278d5c34e33db9f932883990d74ea1cc96b"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.38/rkat-rpc-0.8.38-aarch64-apple-darwin.tar.gz"
    sha256 "abe84382645806664e4dba38c09f0608a525e865a956c0b371103d9827991946"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.38/rkat-rest-0.8.38-aarch64-apple-darwin.tar.gz"
    sha256 "28332eb65e6157a456dafa43243dfc0cafdd2cfe255fca30c6e0c4b72b647390"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.38/rkat-mcp-0.8.38-aarch64-apple-darwin.tar.gz"
    sha256 "25fd4979a221c042ed059a35518b5454535ec0ba614aa5d79ef4e0d332f527df"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.38/rkat-0.8.38-x86_64-apple-darwin.tar.gz"
    sha256 "9b5958937d4d57705fd498bc4eeb365dcd43fc8d8a99de8a33c6697d86466e05"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.38/rkat-rpc-0.8.38-x86_64-apple-darwin.tar.gz"
    sha256 "c3539ad7f7c61f8a896c5f5567c94e96b2fd13158d89edf645fdce7a4f3097f6"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.38/rkat-rest-0.8.38-x86_64-apple-darwin.tar.gz"
    sha256 "719b4160b469a878c116b156ed0db3b56aad454aee279c24ce503576782fea55"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.38/rkat-mcp-0.8.38-x86_64-apple-darwin.tar.gz"
    sha256 "704b208a3f8b85a9022d828815871f004ef51da509aa8282c4649f65d28ab1cf"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.38/rkat-0.8.38-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "347ee3d29fbe3d6aa780b7eb3bf7ca778d9327efed1e09de771b90b10b44f3a5"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.38/rkat-rpc-0.8.38-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7bd2c2373a14f50888bbcb04bf4f4b726ff30a9f6c2bf30a37d17b7ad95271b0"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.38/rkat-rest-0.8.38-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "20384a60283b4413dde3f3010a9a25db4822ba24ddf837f6a6196e184a8bfd56"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.38/rkat-mcp-0.8.38-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "23c2d7a53ff261dad72b486e22e978cc6db0aefa9a52238ccf536b675cda505a"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.38/rkat-0.8.38-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b31f9af395a1b565cff4eff9a0fd6258f1910df051ea63e36fd740f1246d0b92"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.38/rkat-rpc-0.8.38-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "efca69fc1f4c9677f20988ee37936f2c9349e5ac32f07c842c5ffb51006e8ae5"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.38/rkat-rest-0.8.38-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "403a13b3c61e1a12aa8342801e161f89705c05c14fbc817a3a2d64112f695318"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.38/rkat-mcp-0.8.38-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f488e1e4586310c3dd4f35ee60183bff0a6f03bd46eec118f68cc32bf9bbf2e6"
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
