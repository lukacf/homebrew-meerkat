class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.34"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.34/rkat-0.6.34-aarch64-apple-darwin.tar.gz"
    sha256 "bc0562eb25f39e143b0fcd39e9ee04e48e8eea5c8e7d4fff06486f73b8a25b1d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.34/rkat-rpc-0.6.34-aarch64-apple-darwin.tar.gz"
    sha256 "17d6c0d0ad2c9100036ea4c28c417b7da5625abed1f727023a6949b2a874ce93"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.34/rkat-rest-0.6.34-aarch64-apple-darwin.tar.gz"
    sha256 "74dd84b3b46219092584243b9eaf5a2259a7e2e65210fada7abfda866c34354f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.34/rkat-mcp-0.6.34-aarch64-apple-darwin.tar.gz"
    sha256 "0236e8896cf8ef7cc3fb30998a9623703cce9a187a305bb374128e4e42bdce4b"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.34/rkat-0.6.34-x86_64-apple-darwin.tar.gz"
    sha256 "d594042f1e7893276dd12dba120b46bbeadddca019ca023e10337039088eff7d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.34/rkat-rpc-0.6.34-x86_64-apple-darwin.tar.gz"
    sha256 "be5bc5d34f8924254b7c3ecb6714d4d649b9ba8c89cc19867a1708010a484d71"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.34/rkat-rest-0.6.34-x86_64-apple-darwin.tar.gz"
    sha256 "79a31a2b54c71b6422618c967d65c84ba9dd0ede0a268922d74bd3c4c8159419"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.34/rkat-mcp-0.6.34-x86_64-apple-darwin.tar.gz"
    sha256 "125c82b3606187ce89d50d9bf288dc1eadb7f416a42285bf4c28b78659e4b1e0"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.34/rkat-0.6.34-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "dd1f1653a37fdc3f6a65a1161779d8b59863f431843428cc00572dcf6c8a8b52"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.34/rkat-rpc-0.6.34-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7ce44bd28a740fcd14199a76d76be465f4a8cc68571bfd28c4f5b60955cb195b"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.34/rkat-rest-0.6.34-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "670329b4458e1bd5b466f2930be15ad4b07a10506636b8f01d34e4f1d9c87b35"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.34/rkat-mcp-0.6.34-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2cc13ae2c53f1ecdeedee36b79e6d2e5ebae238e0d5a0b05596b4f5ca8ac86e7"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.34/rkat-0.6.34-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "909e4a7bc7dfdb0e6a8e23cae3ea2a54b1c253868285dfdfa2c928bfb65205d0"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.34/rkat-rpc-0.6.34-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6c5a6b89af62c9fde8c1e6b2b10229d5d7e220c1ff056c9c731dc59def6829bb"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.34/rkat-rest-0.6.34-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c73a29f718013d9b154bfe4a0128e96e2207f1abead37a7b7bcd3f4f6760b844"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.34/rkat-mcp-0.6.34-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "eaeeacd09ce38bcd0b2a3738eb0c5c6ed75142974e59eae7e2d7776fe3e11e9c"
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
