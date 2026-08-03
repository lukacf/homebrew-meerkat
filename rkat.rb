class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.14"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.14/rkat-0.8.14-aarch64-apple-darwin.tar.gz"
    sha256 "c857acddd2990f4ddd4eb7594fc3640b178d33934cc94b29cb3ccbd9a0905bb2"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.14/rkat-rpc-0.8.14-aarch64-apple-darwin.tar.gz"
    sha256 "c192d28c736bf7b5346f1a0e39fa408a9ede189c1e24ef3bdfcd0018935624ae"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.14/rkat-rest-0.8.14-aarch64-apple-darwin.tar.gz"
    sha256 "8dbcf43859c3a0d18abcdd30dde7b0418965473d08f91b84c59143c193e1ed39"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.14/rkat-mcp-0.8.14-aarch64-apple-darwin.tar.gz"
    sha256 "424e7b3ad538ffb6a463577dcddc8001faddb12e0d33642851379ecec9c37cad"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.14/rkat-0.8.14-x86_64-apple-darwin.tar.gz"
    sha256 "b05c6a9578a7c4073347c8d819ba3e4a916425f1d8a194db203e8a6083b677bb"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.14/rkat-rpc-0.8.14-x86_64-apple-darwin.tar.gz"
    sha256 "e131c74668a32bcb6f9f5e7dd85a1b54956981478f58a2a13997f8f7d7854b36"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.14/rkat-rest-0.8.14-x86_64-apple-darwin.tar.gz"
    sha256 "99399f76f7b2872e433336cfd6805c50dc4154af481646509fd9277499f7ca8b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.14/rkat-mcp-0.8.14-x86_64-apple-darwin.tar.gz"
    sha256 "95f3cf9a04794a30543c394db321ce05456ce25e914ef2b8707b9810e909bfd9"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.14/rkat-0.8.14-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "cfbb2d2eee5c7b4a35c21bfba23dec893127eaa458898b981612442ec6ade8d9"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.14/rkat-rpc-0.8.14-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "594d6d303425694694e3bb6ab420a610ddee01423fedba5ccef1dbde6b2f7765"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.14/rkat-rest-0.8.14-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "fed47a8a4fd81b5ef048862dc58e000de4d5f6e36a85fdb09a7b83c012351026"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.14/rkat-mcp-0.8.14-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "725f48860bd121e79c54eb597db23e2e86ae91184c0606c062682755c8bf5d53"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.14/rkat-0.8.14-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1d5bff5817cc3234ce3ad77e7b831396ebcc95f66e2d73a1f43768cf3650022f"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.14/rkat-rpc-0.8.14-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c54a4ad3baf03d70f534fb98265d9a7b30dfa2f7afd71a9aa81efb74658f54e4"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.14/rkat-rest-0.8.14-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "19cb38ef0fac2da4f7c53e9072c88177b9fe32b2ad6b842e32a53b0c51f5f516"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.14/rkat-mcp-0.8.14-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "33d0a6d222721adf8462c28096417a6d2f772e66c9917424df76148c3210df14"
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
