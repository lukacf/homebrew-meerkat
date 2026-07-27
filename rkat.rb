class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.9"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.9/rkat-0.8.9-aarch64-apple-darwin.tar.gz"
    sha256 "04c5473c3c8efce999af5e19210c1c1071b657ed1d75a79bac30116818455640"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.9/rkat-rpc-0.8.9-aarch64-apple-darwin.tar.gz"
    sha256 "1e2597a8ebe594829c724307e9109b7f201261e75524c2850b02592e8c0dc4b4"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.9/rkat-rest-0.8.9-aarch64-apple-darwin.tar.gz"
    sha256 "dd58b278d18e4e3ffc38225d1c28e4909f618e53d5f84e2aba053b1a0d962789"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.9/rkat-mcp-0.8.9-aarch64-apple-darwin.tar.gz"
    sha256 "f68c1e526b5e269bc71b922963ec7ac2d58cf8294a906018b95966613f49d20a"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.9/rkat-0.8.9-x86_64-apple-darwin.tar.gz"
    sha256 "8902631a0716d4a9c70ff488b764c86d78c471c192f4c52f99512c52ef71df5e"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.9/rkat-rpc-0.8.9-x86_64-apple-darwin.tar.gz"
    sha256 "fc1727ddd7e5667a34e0e2a5728bd07b19574068efa8114be2e6a8520d2a80b2"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.9/rkat-rest-0.8.9-x86_64-apple-darwin.tar.gz"
    sha256 "ff53f0891da0c1f21bf64890440b76ad2a0185fe816a74cb9fffc5efd15c6647"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.9/rkat-mcp-0.8.9-x86_64-apple-darwin.tar.gz"
    sha256 "3ead5c23c038bbd06ff7d81bdc1bd2bcb1a128027589b9e5b1f5dd3ce46e7040"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.9/rkat-0.8.9-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "28a640235d2bc9edf8cd962eb85e9114d0eae64c1c98d878b988a11b165b021e"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.9/rkat-rpc-0.8.9-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1e9eb9f5d3ff7bf14f7809c8bc351cd446a9474d37e7c30b85e218d31359a212"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.9/rkat-rest-0.8.9-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f8204c59fc2796ba7d2c5a179faac736a4d2e693e02c9bb0ee27f6fb8fcb985f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.9/rkat-mcp-0.8.9-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ce4a818a58d6cde90f3d1f794b1a2535dc4f5f3eda96ec49e42431467607a257"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.9/rkat-0.8.9-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "60df7260c8a8325b834dfa5c8b96d3ef645b21956ef0023cd5169a276dcb825e"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.9/rkat-rpc-0.8.9-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8339ef873a0539cb33a5b8f3eaca173c96864a82425989462e26db747bf53c69"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.9/rkat-rest-0.8.9-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fb7b12d7624fcc5adb7b779f9e3db62d1438936858869d2a965360fbdc026b1e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.9/rkat-mcp-0.8.9-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bfb31a6ea4283042ee5564b1ec87d239162d1cff040b51108322681d86a99df6"
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
