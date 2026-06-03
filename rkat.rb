class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.33"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.33/rkat-0.6.33-aarch64-apple-darwin.tar.gz"
    sha256 "3d3468f99e63f80bfa81db2c4bd51edce7e479d4189721669f57130e2ff26b99"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.33/rkat-rpc-0.6.33-aarch64-apple-darwin.tar.gz"
    sha256 "2a1c32ec297054b385a0a3095d16a4d54a9a09b5ce931c2c7df8b40448350ec5"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.33/rkat-rest-0.6.33-aarch64-apple-darwin.tar.gz"
    sha256 "121afafb65fbd027db3b6350fcd8762ffb7699b7a0d106d9fbbadc7e1ba0e14d"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.33/rkat-mcp-0.6.33-aarch64-apple-darwin.tar.gz"
    sha256 "ed38f162b96be3c0fc0b91d53e42c37303d70c0aa906d9e86929ac4c0b7752de"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.33/rkat-0.6.33-x86_64-apple-darwin.tar.gz"
    sha256 "bc1639aebbb12a2da81990d549733f183f829b43bde9a6d698568239bf69a5df"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.33/rkat-rpc-0.6.33-x86_64-apple-darwin.tar.gz"
    sha256 "3b588bd94d9011728e4adbece589a4551064bc6d8c2bfa77e6d43b6ec74670f5"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.33/rkat-rest-0.6.33-x86_64-apple-darwin.tar.gz"
    sha256 "6f304663ad0796f849833e5ef67a2af07ee1cbdfc2264bdf28065c62e4b847c7"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.33/rkat-mcp-0.6.33-x86_64-apple-darwin.tar.gz"
    sha256 "8ca2927672304c69e85bf3f5b59b93c013cc1f01cb7a02e00170cf53802d32a7"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.33/rkat-0.6.33-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5725538def3fae88371701efcf4ebee85a16caf1035cac17779c111487a13788"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.33/rkat-rpc-0.6.33-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "01a047337ae004e53e756754698f61ca5aefc48d6a3d47205310925e5ead9910"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.33/rkat-rest-0.6.33-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f0037278c55f45c64138a4e65ac9ab4917bdad481b05af4cb6dca9702cb02ecb"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.33/rkat-mcp-0.6.33-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f02a98f51b652fd14ecde9abae85a991b00651e53521465c0a0da29b3d8321f0"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.33/rkat-0.6.33-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "968dbc8d32a15213604a9c39bbbf9c14ad5cbc7a19ab5eaf869d17bdd559a66c"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.33/rkat-rpc-0.6.33-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "475cb9d5f1cf5ff8f778d2edcb604473c5d955ed50e0ab88224a461beeb16979"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.33/rkat-rest-0.6.33-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "63e29cbffc1642bca81eac9d28257289f54d256106081ff04b720d7deee81b7e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.33/rkat-mcp-0.6.33-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "272db7e6025aed9ab2412dfad565fef0af0185cdc7e343ea4311b599c6723ad2"
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
