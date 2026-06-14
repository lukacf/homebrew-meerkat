class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.7.2"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.2/rkat-0.7.2-aarch64-apple-darwin.tar.gz"
    sha256 "b3044e61fad35559a97e395f5dc5bfde9caae8e26970a7f6c3486e1f6e87a215"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.2/rkat-rpc-0.7.2-aarch64-apple-darwin.tar.gz"
    sha256 "9fc6d64c75de2bcf9cb3a51d44d4e2292436ff4daac7a4add54491b06bdef47e"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.2/rkat-rest-0.7.2-aarch64-apple-darwin.tar.gz"
    sha256 "7e20f9ab9e134672ff3aabd346c461427fc3b09d59d89dd833ba00f1d847068f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.2/rkat-mcp-0.7.2-aarch64-apple-darwin.tar.gz"
    sha256 "953c676b3e693585a0bad6c581e4947e83b409084c7fb0d0d9489886eab31421"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.2/rkat-0.7.2-x86_64-apple-darwin.tar.gz"
    sha256 "23940cfadd4a1b0e58770f20f6fe89416da961c9d29e8e308923f68026a09c7d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.2/rkat-rpc-0.7.2-x86_64-apple-darwin.tar.gz"
    sha256 "d06c6b45f50f98e5c084afd4f99507126694e03be5b069a4eb9ad4c0092b9688"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.2/rkat-rest-0.7.2-x86_64-apple-darwin.tar.gz"
    sha256 "5527446c94323019a119a298cc7c420ad5a1dd37410004234f9a084a2a2adbc1"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.2/rkat-mcp-0.7.2-x86_64-apple-darwin.tar.gz"
    sha256 "481ea372fe588c9263354ced48666da6cb01ffdef66fc77e7243a97fcbe9dac0"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.2/rkat-0.7.2-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "626348f13780a22cb617a6d953d7328e6360a6fa16c111ce70bf274928f85414"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.2/rkat-rpc-0.7.2-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "34f2f918260e453f29e34692e6f38d8aeb2a918a20550707c76f658217dc0289"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.2/rkat-rest-0.7.2-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "82f1c2346d65ebc4b465109e76cc73658d70c25f655e55a82c0f515a79649b38"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.2/rkat-mcp-0.7.2-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d0e260ba5cdf602ec0c2a861260bfcd4399d4079f3144a9f0c7ba805bf81ffe0"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.2/rkat-0.7.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5bdf9457267ce3f5593692c52b251aab824cc00d0e206d7c8e8b3c5a730fedc8"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.2/rkat-rpc-0.7.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6de304ab7c851cd09b59b82ce133275952de94e9cfcbee33ff56cd908048a761"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.2/rkat-rest-0.7.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b684542a5be4e572e0fa8a32658b0f09b1f2b8253e55e7dbfb157252597d7782"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.2/rkat-mcp-0.7.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2b451e259ec454833997a5f968a951e6ae37998d891a32b91dca5d3369d93af3"
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
