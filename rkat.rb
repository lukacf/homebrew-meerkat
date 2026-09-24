class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.41"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.41/rkat-0.8.41-aarch64-apple-darwin.tar.gz"
    sha256 "3404c7d4dfcfcba1b88be56d40409533bcc48e68895ee6679d7b04843f4e4712"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.41/rkat-rpc-0.8.41-aarch64-apple-darwin.tar.gz"
    sha256 "1dbaed0caba5a65e02bc2a4b8a8b1bfd5e12a1c8fcb296229eb5077f0199b3ba"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.41/rkat-rest-0.8.41-aarch64-apple-darwin.tar.gz"
    sha256 "b2179e42e34e715199ce36f89e8f59cb98de148f1314b67cb5fd3214e7f39cf1"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.41/rkat-mcp-0.8.41-aarch64-apple-darwin.tar.gz"
    sha256 "4348c369038f751fb97d953802e9a89d367c3cac608088879efb1035ee75ccbb"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.41/rkat-0.8.41-x86_64-apple-darwin.tar.gz"
    sha256 "d5dc53a7b054c40efedb0fb45cf6cbb0d52ce9a03b92e5ec0b76bf886d5d046c"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.41/rkat-rpc-0.8.41-x86_64-apple-darwin.tar.gz"
    sha256 "046d7f99ae99380149ebe7edb75b2724a66e4f51251753ba029776aabc26ca63"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.41/rkat-rest-0.8.41-x86_64-apple-darwin.tar.gz"
    sha256 "323280293208d75eb7b81d49c445a3dab1b00327cf61709f3d1547907595d758"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.41/rkat-mcp-0.8.41-x86_64-apple-darwin.tar.gz"
    sha256 "2377982d48afda8a842c7642e6a7c7c1250ce432521234992122cafdf401981c"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.41/rkat-0.8.41-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0b24758a116e576057771502d321dd12d076442d27ae4a40040c9a6646fd9c3e"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.41/rkat-rpc-0.8.41-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4a826d9288813de6570eecb4b0bbc20cc54cab2a67937d249914cfb24b55c48a"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.41/rkat-rest-0.8.41-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "662d7fdac6cb62ab9c1ecd2fa2ec66ec7f99e7029b0e452ad7bac943f4c48a42"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.41/rkat-mcp-0.8.41-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "340d0a67df149c8349ae57279acf6db14836a01a12d73f08eadd1d616bff725f"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.41/rkat-0.8.41-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "59a76c4379bccc4fa5d0a1f7e3611d11562e6963e25ca994eaae8655101782f1"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.41/rkat-rpc-0.8.41-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0c0dc4dcce01bc97720ed48f6f53324fc94463da145a1f5513833c67b4895b86"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.41/rkat-rest-0.8.41-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b36b7ca0faa1a98b0876b0cd064b152e91545190f104a902aa7d05cefb4097d1"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.41/rkat-mcp-0.8.41-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "334032cc2aa3bdf7ed7307442773102e8c9eb6dd2933807482550046efca1375"
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
