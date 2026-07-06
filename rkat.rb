class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.7.18"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.18/rkat-0.7.18-aarch64-apple-darwin.tar.gz"
    sha256 "d2161fd3b7b4d2ac3d6e0b5344f33a890c125530dd1b2072acc413448448b56b"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.18/rkat-rpc-0.7.18-aarch64-apple-darwin.tar.gz"
    sha256 "06273a201484060275c9dc3d1f798ede27cd034ae2c20c481bb67723f02a8b60"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.18/rkat-rest-0.7.18-aarch64-apple-darwin.tar.gz"
    sha256 "8acffe75ab0d653a89140d84f6dac6061cd9e95db89cc306233b7438ea16a57c"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.18/rkat-mcp-0.7.18-aarch64-apple-darwin.tar.gz"
    sha256 "e823404f592514fb036265faceb5f8b4e7132c3f78feb64b8d0d744860d5ffbd"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.18/rkat-0.7.18-x86_64-apple-darwin.tar.gz"
    sha256 "bd42f9a0d96d78a944891cc7b5242f7e17e06a5262bf8a3512c49bc787c0f60c"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.18/rkat-rpc-0.7.18-x86_64-apple-darwin.tar.gz"
    sha256 "666b0c3450a36ebd4f535328cf6575050eccd3e3b85f48b43d73d4bc160fb3cb"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.18/rkat-rest-0.7.18-x86_64-apple-darwin.tar.gz"
    sha256 "00ae60c021f660d632d5050d4bcd7ee7d4318e11b80b1850f9c565d2ef531f7e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.18/rkat-mcp-0.7.18-x86_64-apple-darwin.tar.gz"
    sha256 "ef4b590f224c12ef5bf21f1bf01c8c02b38f2c614abdbdd97d0e091942e70768"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.18/rkat-0.7.18-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "68fc573dddcad25a829db765328d94e10f301aa30f00cf969bc7ba938520e643"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.18/rkat-rpc-0.7.18-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "60a62be9f3a1ed1734487c7088bf9a9654338c9ddb58f94c59fb56d3aaf78742"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.18/rkat-rest-0.7.18-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2d7cf4da3fb7bc9df701cc92c8ed5d56283c52f54088ba378ca5f0f82feacbfb"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.18/rkat-mcp-0.7.18-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e271153c3de085d49c76dc35f3cabd33ae9726ed656d5786c93cc105f644b2ef"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.18/rkat-0.7.18-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f779be91db020ddeedb8ac5ed103f5c804da79db99929240f4bc10eded5e3789"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.18/rkat-rpc-0.7.18-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e8951e7b138f244f94ab71c9eb56b59a69323a37feeb4c128a8c6adbe589b450"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.18/rkat-rest-0.7.18-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "60a3181dc1c923c99faeb4a07d4400a404585e021b2fbaca599eb13013f0fc39"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.18/rkat-mcp-0.7.18-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f6d83c99821c6d361c021895b83c505a2ccd03e45c51e68d60be0c79ff9ab5ab"
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
