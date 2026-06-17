class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.7.8"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.8/rkat-0.7.8-aarch64-apple-darwin.tar.gz"
    sha256 "78d83fe2b00520e45bf8628164c66458d5f0f5bbcee4b1066f8b2fa83c318c9a"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.8/rkat-rpc-0.7.8-aarch64-apple-darwin.tar.gz"
    sha256 "d89aed45c41a48ef562d94a968474d51f2d953dd10c75fa292f479e1a0093b4c"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.8/rkat-rest-0.7.8-aarch64-apple-darwin.tar.gz"
    sha256 "f4990a5a1bb29f0c81c2475a68d3f895b1f0169b5b07c881457a822eb12343b6"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.8/rkat-mcp-0.7.8-aarch64-apple-darwin.tar.gz"
    sha256 "5bafd9708e9a050259b9d01334abbf412cab6d7098be40f065b165f9d5268256"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.8/rkat-0.7.8-x86_64-apple-darwin.tar.gz"
    sha256 "0f56d2c0c88e01511f732114b14428c4952f26dbfed8ad6eea86ef2bd5433c72"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.8/rkat-rpc-0.7.8-x86_64-apple-darwin.tar.gz"
    sha256 "5faf29196ec7afa143700c4518e5e43241cfc9c3624b8651993b9ae786c0d409"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.8/rkat-rest-0.7.8-x86_64-apple-darwin.tar.gz"
    sha256 "07b665635d650eec1f7bd66ed144336263ea85c5176a5e5367450d43127e27bc"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.8/rkat-mcp-0.7.8-x86_64-apple-darwin.tar.gz"
    sha256 "073f9d4e4fab8744a75926e6b742e767442071ad6a2a01917cb9e2fe62392744"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.8/rkat-0.7.8-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0220f7b717b8676aa679d2ebfecf43ecc68f4adb7dfce085f76870305324925b"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.8/rkat-rpc-0.7.8-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2fa0163934dfa0eb4fc3b27ceed66b1c91b915c662ba190fb02413d753924594"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.8/rkat-rest-0.7.8-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ff1ea3c21c78ad4b22de75c213cbe99da5f7e768337cd341b2e23d44678f289a"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.8/rkat-mcp-0.7.8-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5f425791c74679686c2fafa295f84c8f5fbc6fdbf0279c4735d386ca4d07d7d2"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.8/rkat-0.7.8-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "09a92097790129a2428dd4220793a5ab79286ea5e0c1e537d08e63d2c5f59b80"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.8/rkat-rpc-0.7.8-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e9f50b3f28d657738767eca53daecb0d8cd924fe8b40062ab544fcac4cc434ec"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.8/rkat-rest-0.7.8-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0b57f9fd1aa338a7380362f01b5312ad1d1b8205ec8b3a8c1ce7a9fc1a3ee86b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.8/rkat-mcp-0.7.8-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2fb1309656d7f5c04536493eafed31f9c4506f8b9f1068ab5c171ef456aed779"
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
