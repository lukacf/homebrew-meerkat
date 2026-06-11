class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.0/rkat-0.7.0-aarch64-apple-darwin.tar.gz"
    sha256 "24cd109b5dfda5e4dd7b9852435b4d7aa6ffc3368504ba53680fc8b0ba89edc9"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.0/rkat-rpc-0.7.0-aarch64-apple-darwin.tar.gz"
    sha256 "612bd3cb2a0abc37c13d84039bcb43fd1de569dfbda03f1f41a6d2a85cac5735"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.0/rkat-rest-0.7.0-aarch64-apple-darwin.tar.gz"
    sha256 "5128606a90697cfea36f26ccdb0b2e851521c4f3b65022c7fbbf116c6e5a3c24"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.0/rkat-mcp-0.7.0-aarch64-apple-darwin.tar.gz"
    sha256 "027b643718c546642d35f8a340a95e27e7222ca61850d464e8ea95a8f95a85e7"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.0/rkat-0.7.0-x86_64-apple-darwin.tar.gz"
    sha256 "5197fa5785fb4e271b29c36cb375d71c8ff9ab0e62124414f8133bb4a7355081"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.0/rkat-rpc-0.7.0-x86_64-apple-darwin.tar.gz"
    sha256 "cc628f3aa7023bb85600db32df0ad5ef12c083ff9a123e3cae9ec746f6081ad3"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.0/rkat-rest-0.7.0-x86_64-apple-darwin.tar.gz"
    sha256 "4a5d15116e9e6d5d066301ba091571ba8cbfcfb77cf3aecef16ba498deb963c8"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.0/rkat-mcp-0.7.0-x86_64-apple-darwin.tar.gz"
    sha256 "d679eeca8e3341f65a6b37b2de6166e6f97c727d13fdb85f99f88e1dc59e5356"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.0/rkat-0.7.0-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f1cd890f03a7e763a1e5d0af4ee573e6c949b25b2163301f91bdbeb8e0e360b0"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.0/rkat-rpc-0.7.0-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d80267d0f78a6f843aaac4015d82fa8a17cf1c4fa63a296722e3bf7133ad5c53"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.0/rkat-rest-0.7.0-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2391082fd18b56b35d732e209fc01fc8f6bd3000e984d5e4180c2fe062fb718d"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.0/rkat-mcp-0.7.0-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "91f7231f750f08c9043649359d43aeff3e10212643a7f49c02fc0cc3c01aa4aa"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.0/rkat-0.7.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "394fcc66e1321c762649804dd0ab9c3bfade33a74b1fa64c3296ef4c4e6f751d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.0/rkat-rpc-0.7.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ea9a5c5af47bccb683a5baaf62e331cbb9c5f523992f85b012e2f66f59055901"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.0/rkat-rest-0.7.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ed5cd5e8ba722a23416ba1bd0462e9f20b7afaf744aee32b325b0bdc08c4a842"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.0/rkat-mcp-0.7.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e2c9c4db825508a2aa34a9fce88417ca39dccdfaf7742312eb4132b88a3fc3fb"
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
