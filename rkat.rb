class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.21"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.21/rkat-0.6.21-aarch64-apple-darwin.tar.gz"
    sha256 "9f296c063722f670b85dac40561a89f1c46ee9cd738b406120c6b87bc67adb5b"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.21/rkat-rpc-0.6.21-aarch64-apple-darwin.tar.gz"
    sha256 "c0ae38a5fc5fef38f908ee7d53394ce7830fbc20ab026380036f6c2346fee8b3"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.21/rkat-rest-0.6.21-aarch64-apple-darwin.tar.gz"
    sha256 "ef4980e319c252aa95d925e56d1b023225d491e188f5739bb5bbed9eb272ca82"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.21/rkat-mcp-0.6.21-aarch64-apple-darwin.tar.gz"
    sha256 "6f612436399391338ef3be0f74642b8052870a3d72ad44630855d98f61f3e74d"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.21/rkat-0.6.21-x86_64-apple-darwin.tar.gz"
    sha256 "0479412bce0c357584046399db3d1e99c268fc8cadd0ef82e4f50cc0bc0d1ad5"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.21/rkat-rpc-0.6.21-x86_64-apple-darwin.tar.gz"
    sha256 "fb36d25ca0409b8fb2a8b2eaec496b2338cc845081aa2cee25a297e9eca08f43"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.21/rkat-rest-0.6.21-x86_64-apple-darwin.tar.gz"
    sha256 "4346f78a9a17a373fb1613f06d97f39d804143a0f1c8ec4c5c1b0b93195cd20b"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.21/rkat-mcp-0.6.21-x86_64-apple-darwin.tar.gz"
    sha256 "8f343779670210f14cccbabe575ac805eb75223ea1cbf98234118b825a45d6dc"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.21/rkat-0.6.21-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9209c5776ddec858212dac19a8c84e516ff13b377f6545cf70878a470aeddb62"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.21/rkat-rpc-0.6.21-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "78a6c35940e17b7a1fc4787cf64d61dc864fbb1f8300035bb100ae652e7b260f"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.21/rkat-rest-0.6.21-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f12042279d05ac998e32dc219d198019062a8931876793e59acac3b4e943da99"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.21/rkat-mcp-0.6.21-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "775367bd775d901721ad598d97790aeaf340d196edc643c6e55eae04ca349ed8"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.21/rkat-0.6.21-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2ec94267987acf376ae91b77b60f0e74ef1e3f38edfaf71fbdb927b3f400da80"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.21/rkat-rpc-0.6.21-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a81549deae64e97d73a92ba18f19656d063f5c1ecd9e688b77a3f0e691ca1044"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.21/rkat-rest-0.6.21-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "200d096b82f23b5127d7067542f8974467a1a2ca209c0625936f8dadaa8ba234"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.21/rkat-mcp-0.6.21-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1de3a45335bbdfa84d237223d73c47228cde4bcd5ab51e147a733b87005dabe6"
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
