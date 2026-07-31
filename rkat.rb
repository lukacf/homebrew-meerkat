class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.11"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.11/rkat-0.8.11-aarch64-apple-darwin.tar.gz"
    sha256 "84ced1649e873f32ba0d6e090d6bf6f68ea4891478afc9ef2ee0f817d89cb51e"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.11/rkat-rpc-0.8.11-aarch64-apple-darwin.tar.gz"
    sha256 "63eb9a171d0d4e3926781197b127a8279c23f0ebdebe12036897cf380ee0d91f"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.11/rkat-rest-0.8.11-aarch64-apple-darwin.tar.gz"
    sha256 "85b80d833a3ca389dfdd95c9399d12170baba302fe901c1f77f7bf0fa8786b1f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.11/rkat-mcp-0.8.11-aarch64-apple-darwin.tar.gz"
    sha256 "bbb384a29729bb216cfd686819f4465d0f6d122471ed5005e46c88c02b29b833"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.11/rkat-0.8.11-x86_64-apple-darwin.tar.gz"
    sha256 "717ce40e2b0c304e70ecd3565bc1796232e82ebb338d32c190e103f64d47ada1"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.11/rkat-rpc-0.8.11-x86_64-apple-darwin.tar.gz"
    sha256 "c2f38cc3ae35c51f27d54cf0c4f6fa65cd9e284722d9497a156b0583487aade7"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.11/rkat-rest-0.8.11-x86_64-apple-darwin.tar.gz"
    sha256 "f21f4840159fd14e78cfaeb2a43dee7bea9d341465d49f1b81cc06581a4d84a6"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.11/rkat-mcp-0.8.11-x86_64-apple-darwin.tar.gz"
    sha256 "ab549e21c5e1e9581ba410f8dde4ad37d27654c0c2258cad6986a394926cc754"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.11/rkat-0.8.11-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d1fe36c184029a9552ce1428e676a457e3a9bc06e5578faea81a672c8894a558"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.11/rkat-rpc-0.8.11-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "339ed567ba83c56742096dfe5a5ce323d3e51d7d55625cda947f653ecb9f3bd0"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.11/rkat-rest-0.8.11-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9374c9879e0c11d60d82e24be0835cb6593629a9df55a32e6659ac39104553f1"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.11/rkat-mcp-0.8.11-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "91c124026b7900fedba093c3925618ca9b85308e748930da0b4e53842baefc78"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.11/rkat-0.8.11-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ce3d35ce61bc1415f35f02ffc6a0a0dda29676316366c8d67831c57ab00fead3"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.11/rkat-rpc-0.8.11-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ce76b7313ed3acb890c908318bf8e5937bb69845efb449f0314c602012cafbe4"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.11/rkat-rest-0.8.11-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b71546581aa71e570c8acfbb1b65452d1e708fb76d734ab1b53326f383f325c8"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.11/rkat-mcp-0.8.11-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5c521df9c9d6db936c088bd804e0f3e0e421ef80a9bf89251ad84a6f3af8004d"
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
