class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.30"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.30/rkat-0.6.30-aarch64-apple-darwin.tar.gz"
    sha256 "d7752a3fe8ea5617eff766aee649ff081e3391a22bf35641c92345e2185385d4"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.30/rkat-rpc-0.6.30-aarch64-apple-darwin.tar.gz"
    sha256 "e410d8d1e0f66916fc711790bcf19270c5ff88818835fb0d3c168379429ae0b4"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.30/rkat-rest-0.6.30-aarch64-apple-darwin.tar.gz"
    sha256 "23c8a54cf28f4fc14fb66db385385911c355118dc95b8cf90f56ad1eee35f768"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.30/rkat-mcp-0.6.30-aarch64-apple-darwin.tar.gz"
    sha256 "aef5628d40faafe4df946a3e4efba3a3b8309dc31a906efff708c31fde83782b"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.30/rkat-0.6.30-x86_64-apple-darwin.tar.gz"
    sha256 "4993ea82f93905bb1226a4526eaf7572fd3522a60214599c05575e43e3efc239"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.30/rkat-rpc-0.6.30-x86_64-apple-darwin.tar.gz"
    sha256 "04ea64d38fd7388c1c7c7a920e38ddaeab719901b0de629bba6d0c1f888652f0"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.30/rkat-rest-0.6.30-x86_64-apple-darwin.tar.gz"
    sha256 "26eea16ad54fcd55cf6b564d745caf2d4422b15280c47be4bbb00d534bfa748f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.30/rkat-mcp-0.6.30-x86_64-apple-darwin.tar.gz"
    sha256 "7b1ff6e52e192b6a1f10b965541d29523beaca7b99a5556e666b7cec338742c4"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.30/rkat-0.6.30-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c0249b5952394875be35cb085c5429639dc0e429bec15f2137fe1274c88e2315"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.30/rkat-rpc-0.6.30-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b840985b6a6dc0fecb6c641bf58ef1c8060c2c2b5943ba1deb203a64553509a2"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.30/rkat-rest-0.6.30-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "72b194580a36d2676b5149e3616df1a926b528993e8e36a95a51e8effa5a2a7d"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.30/rkat-mcp-0.6.30-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c7c2341f63e7f965479ae1934edc2daf6c48409f90a17ea991e84106635cb935"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.30/rkat-0.6.30-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8cf47b86cc285873ba0f1397e03c748637e58e3b916594e42c5a0400d3ae7e3a"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.30/rkat-rpc-0.6.30-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fdd564b3d5ae5f71d57ab605dccd29e3f35f23a4ef1969d9353f07a333b6d3ef"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.30/rkat-rest-0.6.30-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e4194ada4944f6899cf18ee1c6c0644082907ced2f1500f3d95a18702172b67e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.30/rkat-mcp-0.6.30-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a82e21bf8753b7b55b73261f12b12cc6ebbc5776d4ee5980b1cd2876f41aaaa9"
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
