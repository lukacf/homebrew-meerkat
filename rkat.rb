class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.7.26"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.26/rkat-0.7.26-aarch64-apple-darwin.tar.gz"
    sha256 "2622a0996c8837af3183f8155930f6a74ddb1535dbfe51bb37118f763bdd0596"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.26/rkat-rpc-0.7.26-aarch64-apple-darwin.tar.gz"
    sha256 "a3e064694ed1e7fac42efa9a025e33d9e06bdf2bef18312a9ff41c0819ba289d"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.26/rkat-rest-0.7.26-aarch64-apple-darwin.tar.gz"
    sha256 "ae47209935763fb9454fc97a4204af9cd51120471f4e985030ffe8fb61d5e1a9"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.26/rkat-mcp-0.7.26-aarch64-apple-darwin.tar.gz"
    sha256 "352ac7024c3c14822ef81dae45bc1e1720505acc8865875f0967b316a7b61c1f"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.26/rkat-0.7.26-x86_64-apple-darwin.tar.gz"
    sha256 "351942c8deaf46a37ca1d3c625f60f7ff6fc5abc71826f2548894d655ef96c12"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.26/rkat-rpc-0.7.26-x86_64-apple-darwin.tar.gz"
    sha256 "832a99a84ab7856775ee1440e41b8fb7657697c04a195943bbf3bfea752b8a71"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.26/rkat-rest-0.7.26-x86_64-apple-darwin.tar.gz"
    sha256 "215f090137ff14ed3bcba1879f0f228608d9b98a4f3e457741c71a48db964237"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.26/rkat-mcp-0.7.26-x86_64-apple-darwin.tar.gz"
    sha256 "62762ff51ea57f6d127f702d1be8c224fddaaf8e356e5b3b05894a9192043c2e"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.26/rkat-0.7.26-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "30a97ebc147cba827226c9c642b695e873a4f333b8feec0890de8ff52539d4a4"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.26/rkat-rpc-0.7.26-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2da282d21c7591c6275fd5e18b6496387f78f134149c934c5cc64a3f957154ec"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.26/rkat-rest-0.7.26-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "41ed0beee1fc3c21b8362c35318a6ca2d21adc3005cd231cab1744b45090d963"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.26/rkat-mcp-0.7.26-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ab5cde7a5f05af0f99a6b582ed09966d5c6f560d6017b1ada0889ee3e55ef546"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.26/rkat-0.7.26-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0dad233ac835b3866cd42847c1b363a77072f62a648b041f8a8b46cd58b5c63c"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.26/rkat-rpc-0.7.26-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2740e57109c953bb302810038981902d3bd21ddc1a45d3d3744dafe05161d351"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.26/rkat-rest-0.7.26-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "97705f9294c8e67e3b99c5f4f2a030de99b68d3e49d37089ab92c2f0373b970b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.26/rkat-mcp-0.7.26-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f79f6f7217c9ca694484081f6a2c690df5fe0993029648d5d8769839790a0928"
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
