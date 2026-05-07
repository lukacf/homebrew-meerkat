class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.1/rkat-0.6.1-aarch64-apple-darwin.tar.gz"
    sha256 "eaf0311ecf3de8dcf9be4140c50c1041db0c832bf83da33cee55971ac82c7020"

  resource "rkat-mini" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.1/rkat-mini-0.6.1-aarch64-apple-darwin.tar.gz"
    sha256 "325cbc5089c13d7121cb3b0ccbb1b72529b3eb87afe1ec11aefdcd288bf6e3e7"
  end

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.1/rkat-rpc-0.6.1-aarch64-apple-darwin.tar.gz"
    sha256 "37d8720af9325c05927dff7bb437fef31961490ad0eaa0077b1b763259a47b96"
  end

  resource "rkat-rpc-mini" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.1/rkat-rpc-mini-0.6.1-aarch64-apple-darwin.tar.gz"
    sha256 "e06d3f4f042bc248907195dc23f02622458d1ad80207d7c19805c406165422c8"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.1/rkat-rest-0.6.1-aarch64-apple-darwin.tar.gz"
    sha256 "bf16a3aa5899b57ebc298c76e472235e8b6de89e723c89f61f875f9f6e37063b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.1/rkat-mcp-0.6.1-aarch64-apple-darwin.tar.gz"
    sha256 "f338596f334de28bc80b9db51610f97754b6fde8480b26171ecee5b54122bd38"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.1/rkat-0.6.1-x86_64-apple-darwin.tar.gz"
    sha256 "d97fab2142bb41f61e32fba61eb0381e9e94e9e58d254a3d61bba58dbe55f5db"

  resource "rkat-mini" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.1/rkat-mini-0.6.1-x86_64-apple-darwin.tar.gz"
    sha256 "7fc768dd929248f7d5931d238d940ec65f7e813dd4e0150f7a9b96b33bfb86af"
  end

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.1/rkat-rpc-0.6.1-x86_64-apple-darwin.tar.gz"
    sha256 "a8299156b989d6dc65829127dde0563720c6208fa9b7b3dc03ecef82885b4a4e"
  end

  resource "rkat-rpc-mini" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.1/rkat-rpc-mini-0.6.1-x86_64-apple-darwin.tar.gz"
    sha256 "7a216e6af15eaeda65646293da4039b885c4b9b7617798d396928e37dfc2b581"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.1/rkat-rest-0.6.1-x86_64-apple-darwin.tar.gz"
    sha256 "2688207b0b8d56c129a463a65ea01bc7f227c3a4e294952c07f93bcd566a90ad"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.1/rkat-mcp-0.6.1-x86_64-apple-darwin.tar.gz"
    sha256 "8e3c974598f5d7393e89b0e47d4b38f30c4bd4b2038ba02e9659c907c717b63e"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.1/rkat-0.6.1-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c9da7f76e1a5b4d116a5648bd95046886189aeaef4a26fc574c31db446d3d5a8"

  resource "rkat-mini" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.1/rkat-mini-0.6.1-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1de3b9f4b7fcb1aa7b7a349208c509255b1eb29d20c49a2f9bd80ae53612025f"
  end

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.1/rkat-rpc-0.6.1-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "299f04c861048dc66aad69ed7c85955aa06f2a5822aed15aa53cc012fe43d9ff"
  end

  resource "rkat-rpc-mini" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.1/rkat-rpc-mini-0.6.1-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "64ed8b67f3a301ba303762250f4355d8371473ac57c38fcd888e9983ec517a67"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.1/rkat-rest-0.6.1-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "956ed6e9d75f7ced08215b1f9b102bbda8e5585ed913ef8e0b26a3ca48908aea"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.1/rkat-mcp-0.6.1-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "64bce72f7d771bc34aa8595a5e6c89b03b21e7801b3a07bb8746c14f50f247a7"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.1/rkat-0.6.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "155f8bbbfcb60be4892625c96a03bafbd8c121c1dc9e25e60ed0de7480996a6d"

  resource "rkat-mini" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.1/rkat-mini-0.6.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b3bc8e9f06600a3001dcfb891b4ffa9e7b1499c94c4b27feefe5f398f8dec7dc"
  end

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.1/rkat-rpc-0.6.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "40c52e4ede93c920468b4b22f06d5fe5f538fa618e930dbeb12440a452086ba6"
  end

  resource "rkat-rpc-mini" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.1/rkat-rpc-mini-0.6.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "15a3aefaa40f8017cffa438be4174f16b439c6600ba0980ec6649e38ef0d948b"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.1/rkat-rest-0.6.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "55dc1947daca5574ff90cb1942c1bc3a7851ae8c508b8749e7e5b983a2c965e0"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.1/rkat-mcp-0.6.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4fc83c10cf836bec359baa22da83f9892c68bc9ac865b56c5d453c61e4fcd23b"
  end

    end
  end

  def install
    bin.install "rkat"

    %w[rkat-mini rkat-rpc rkat-rpc-mini rkat-rest rkat-mcp].each do |name|
      resource(name).stage do
        bin.install name
      end
    end
  end

  test do
    assert_match "rkat #{version}", shell_output("#{bin}/rkat --version")
  end
end
