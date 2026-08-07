class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.20"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.20/rkat-0.8.20-aarch64-apple-darwin.tar.gz"
    sha256 "7cdf580c4a0606c5466e3859dfbd5e81b869b7047a8ed4d42da05611e684da64"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.20/rkat-rpc-0.8.20-aarch64-apple-darwin.tar.gz"
    sha256 "90489c6f8233c826ba6f5bc4448a010e7cef8c8c95cc53032507f581b648a176"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.20/rkat-rest-0.8.20-aarch64-apple-darwin.tar.gz"
    sha256 "2c0eba7baf7fc362dc6ac9db56d0b6681ace9706edb38596159658b6832fa403"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.20/rkat-mcp-0.8.20-aarch64-apple-darwin.tar.gz"
    sha256 "ab524a149f6e7fe67915bd065d175edddb7f811bbbb3e04866f5be2045e1a727"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.20/rkat-0.8.20-x86_64-apple-darwin.tar.gz"
    sha256 "f461f3dfdd93ccda0ab7cdf52372f66908fb4fce22f28565049c9d5f12ebd7b4"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.20/rkat-rpc-0.8.20-x86_64-apple-darwin.tar.gz"
    sha256 "32f26250e707419b45e56d109b064fb8ad5d74a86a3f43aa5e8a23bcc412f291"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.20/rkat-rest-0.8.20-x86_64-apple-darwin.tar.gz"
    sha256 "15888d00b9ac0a7ee22d39a83e6641905192684f55b35591f6f5b61e69c7e71d"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.20/rkat-mcp-0.8.20-x86_64-apple-darwin.tar.gz"
    sha256 "48d2ccc0026ed2c016a40fc76b1927c0db1b5ac8e32b9620dd67acd3bdd208ab"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.20/rkat-0.8.20-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "636827db20d55224a75610fff9b6046dd31b08f23188d709090e4bb5f399480c"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.20/rkat-rpc-0.8.20-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "87631f7c5129041a1e096b69daf9c4fa2a1f29bdc4dd8420faf79560000fb4b3"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.20/rkat-rest-0.8.20-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "78fb98d616aeea893e539270bdc8bbd27b8b67bf18d97f8abe5ad4fcae454611"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.20/rkat-mcp-0.8.20-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9c02c06799dca09b32e4a4c66c052a25d707cedf1f562f67195ed73068d80648"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.20/rkat-0.8.20-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7683ed83dffea82626157c3bcef24a95f87524c30696965961e633dc980fa880"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.20/rkat-rpc-0.8.20-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5f188d8b13d45e4101c90f498937c188344b91eaf3e27e37acc0d718db3d1f2b"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.20/rkat-rest-0.8.20-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4eccdce4634258c23e76a5274ebe80287bf9387c1b9c32dd1ba42df2d297c55c"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.20/rkat-mcp-0.8.20-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "014a66aebda7244ac8c7a8892c509365dcf9b912f671e96150d56ab8315ddca6"
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
