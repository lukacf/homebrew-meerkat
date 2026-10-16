class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.9.2"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.2/rkat-0.9.2-aarch64-apple-darwin.tar.gz"
    sha256 "7b1ccbd93aaaf49b46124b5b10c52e74a35192dec2741c2ed3460434874eced0"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.2/rkat-rpc-0.9.2-aarch64-apple-darwin.tar.gz"
    sha256 "299043ff50f2ea28084689e0e1a715e02feacff266b5cc5884d51f41b4180b9b"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.2/rkat-rest-0.9.2-aarch64-apple-darwin.tar.gz"
    sha256 "d053dcd53eda7d22ae863460d60876ee74711c40fc70af8f4ac5c3098dbe565f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.2/rkat-mcp-0.9.2-aarch64-apple-darwin.tar.gz"
    sha256 "6883dc1602827c0e7cae140aa5567e5487fba920b967da9194df11f45be259a9"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.2/rkat-0.9.2-x86_64-apple-darwin.tar.gz"
    sha256 "e091a9a5dba6b865ab1370e3f41dd32bc08b1d77e19e56446235671fcc810e38"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.2/rkat-rpc-0.9.2-x86_64-apple-darwin.tar.gz"
    sha256 "35e35ec4547ce2a2300981af73bad1f8a69a554840850e7f3276e5b24bca977f"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.2/rkat-rest-0.9.2-x86_64-apple-darwin.tar.gz"
    sha256 "51b498ce5f62f316774748e9ccd9874dc19591bf5ad169409136ccc6af38af2c"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.2/rkat-mcp-0.9.2-x86_64-apple-darwin.tar.gz"
    sha256 "ac4563c6b38bf65db432010730541d7170c7751e491634f8b8edab67ddaf01ec"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.2/rkat-0.9.2-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0e5363bbabdd3d1fc1ba82bdd46ddf6a9dbf29cd9cd42c45a98579a2b920837c"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.2/rkat-rpc-0.9.2-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "23a1452647086b9ab8f58e8cd605bb44e60c487f746d2eb2353fc86a6110155c"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.2/rkat-rest-0.9.2-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4a9e55248f1e1d788cc66f706dafc87ddb5f20d0dd421d6298e3339ecd5d2f1e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.2/rkat-mcp-0.9.2-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "afd883c734e22ff17cc944f8361e0fd0c078cc1858914b096f3344712bad74b9"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.2/rkat-0.9.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e9bc21fd870dad290c3f4601483c4900d10f7f0f9ba3764f803bea66afb257e5"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.2/rkat-rpc-0.9.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "354f2a986e7e189344a0b2c3c032d252aa9bfdbeab40121875da71e0f171fc13"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.2/rkat-rest-0.9.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e29d33ae80e1ce0a676989ece7e3f59ced721828e5474cd72296477bb349b238"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.2/rkat-mcp-0.9.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8a086a8ec244680188f139acc6ddd0f4e082e77324745b031a66c8cb386ed7d8"
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
