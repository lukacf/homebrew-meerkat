class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.32"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.32/rkat-0.8.32-aarch64-apple-darwin.tar.gz"
    sha256 "f1e5b9f5c82a42a955b2a5b5d44108ded10619dcc5e1fe13b14dc027fdef75aa"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.32/rkat-rpc-0.8.32-aarch64-apple-darwin.tar.gz"
    sha256 "b8f06509e32729b53223aa650eda6bbf09dde00992c3a264e4fcad9d77e6ec9e"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.32/rkat-rest-0.8.32-aarch64-apple-darwin.tar.gz"
    sha256 "64e0b2e9c64702dd34f1c5dd197ddbd4df7fb14066c0a0c8bc049405e19befbc"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.32/rkat-mcp-0.8.32-aarch64-apple-darwin.tar.gz"
    sha256 "0279dd40aa807eb0829985dc2ff0bcecbc11e5aaec838678aa181fb411de31fd"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.32/rkat-0.8.32-x86_64-apple-darwin.tar.gz"
    sha256 "5a1cc539d244dac2a1b10ed91709ada0b99389cd422f705780e8be0f0b13cd2d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.32/rkat-rpc-0.8.32-x86_64-apple-darwin.tar.gz"
    sha256 "dc3e8972d89b34d9bb1e7b501660c186a25e5398fe05baee682f7bfeacb4e3a5"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.32/rkat-rest-0.8.32-x86_64-apple-darwin.tar.gz"
    sha256 "5ffe7d9098f5c6041438d554f1f6ca57d8118e5e581e53b0c2f6992302ff4ddd"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.32/rkat-mcp-0.8.32-x86_64-apple-darwin.tar.gz"
    sha256 "14e8d4facb17c01019788c719618390f7f602207c2d7d4f2045fdd93aefc0c07"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.32/rkat-0.8.32-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1d2d04e3e6505e0cb69cc44a83e4abadb66db860d89a2b371feffc1290ecb6f8"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.32/rkat-rpc-0.8.32-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "cfa3062261aa1790964db3f765b0b507f60339ddb416292af5f05341b03c69f9"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.32/rkat-rest-0.8.32-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "41fc733565809eef88b1701fb33752cd2f87576f02aaa3244baddccb986f7258"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.32/rkat-mcp-0.8.32-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d8af07e83e7aecc7c3be1c95bf6778a471ed474c243afaa84a39dfc53e6f5b73"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.32/rkat-0.8.32-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7ff7834a94773931a3fce0a2fa6d7ad0af01a59b7233b3856a4119c621a0b183"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.32/rkat-rpc-0.8.32-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "db204cebba18b02bb351b019eb277f38c7d6d3aecebae5fab93195b74ed25c6c"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.32/rkat-rest-0.8.32-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ee6042c310171e06b2b0a2a7f4271dd85468ba9fb90b962405e8e98e6cbebf94"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.32/rkat-mcp-0.8.32-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1a8b1ae240ad4bd5ef1d432ca6f899846661beef23f9cea84c4f03bfa0faaff2"
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
