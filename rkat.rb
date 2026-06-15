class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.7.5"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.5/rkat-0.7.5-aarch64-apple-darwin.tar.gz"
    sha256 "3e7fa34aba8d905eebe543bfd51573f038f2db5c1c1b5974ab6a54737b3abddf"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.5/rkat-rpc-0.7.5-aarch64-apple-darwin.tar.gz"
    sha256 "ac28d11565d9920b9a638c759ae6dc58dacc9e8950e0d1cbb8b53edd2f811f86"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.5/rkat-rest-0.7.5-aarch64-apple-darwin.tar.gz"
    sha256 "113600dcaf360f2ecff35360b03be3a41554e5a078ded345ab9f7eb4a47fde73"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.5/rkat-mcp-0.7.5-aarch64-apple-darwin.tar.gz"
    sha256 "271da11e83767281253d8a871f6df25363cf501b58e3d85774a8008d1a32add6"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.5/rkat-0.7.5-x86_64-apple-darwin.tar.gz"
    sha256 "dec01892f1c462b8cdd92315b9e9a2b774a7d4623ac130aaf5261927853d544b"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.5/rkat-rpc-0.7.5-x86_64-apple-darwin.tar.gz"
    sha256 "e09f192d23ede22dbad3715a8f2b2099780a61ba23d00563ee1b2a97b93724f4"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.5/rkat-rest-0.7.5-x86_64-apple-darwin.tar.gz"
    sha256 "48664823aa246b699184ce57c6b0c552ee0f5814b329f7d5ba35bcd67335740e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.5/rkat-mcp-0.7.5-x86_64-apple-darwin.tar.gz"
    sha256 "1e301e4109acffc09f66b50705b6a1c915d0d49cc62778033bee13f9cbbcd963"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.5/rkat-0.7.5-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "daa3a88ce5f5fb9ed5be3b9dbf16f52e3c0ff9a2a46c10fadbddd680641b6309"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.5/rkat-rpc-0.7.5-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "cb7e20d28da5c12ec8331c4aa6d43f310d668d4a6fe5fa18a30baf64f729e7e4"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.5/rkat-rest-0.7.5-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0e21e12ea7324cfec3d6cde07970053d17fd66334c622fad9084a6f259ebfe54"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.5/rkat-mcp-0.7.5-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7a5447f5ab02f3ddf4c4f0acfa038f283002763b41c5de59320a4cb8bfd715d6"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.5/rkat-0.7.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4e4b4a9edfcf7e9eef319f6f0e1739b06e0ad2481acdb11629cb817a9ffe082d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.5/rkat-rpc-0.7.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "28b64c9d7befc784df4990bf29953d0b79bb48855c7bbc5fa40c1000d3339ca2"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.5/rkat-rest-0.7.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b15b3c36b2853e264373d61f809676fbca7dbf0791ca5e52c9a35388ac885bf9"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.5/rkat-mcp-0.7.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "feba45bd0003d21bf1d8968e41890fde9e203b3650f3fd298642947810a7d069"
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
