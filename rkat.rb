class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.16"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.16/rkat-0.8.16-aarch64-apple-darwin.tar.gz"
    sha256 "46ac5c1d25bf07e1e4737eae35c9c450c73a1ff324a8fced6a4dd0d018ae4b20"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.16/rkat-rpc-0.8.16-aarch64-apple-darwin.tar.gz"
    sha256 "65c05ed81d95a1422ae52583a1012001c629dabc52d0cf1a95cd3e1da4ee33ce"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.16/rkat-rest-0.8.16-aarch64-apple-darwin.tar.gz"
    sha256 "fe145a604185449edad2cea3cb4467e32daed49823bdafc9b0a3b70625a65aa8"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.16/rkat-mcp-0.8.16-aarch64-apple-darwin.tar.gz"
    sha256 "24fe155647f868f2515c21fb1f3cfd6b99977d2e408bda1bb1be13de81af88c2"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.16/rkat-0.8.16-x86_64-apple-darwin.tar.gz"
    sha256 "3261e0119419f681768ea500190804f52737695aa727af0d6d6024a4fbcf9ac0"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.16/rkat-rpc-0.8.16-x86_64-apple-darwin.tar.gz"
    sha256 "f976370e56eb053d904fa91db8e09435d66f855cc704cd61be831049470ce9c6"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.16/rkat-rest-0.8.16-x86_64-apple-darwin.tar.gz"
    sha256 "17b0d1f713a55ebb147ef0f34e17179cc16c5ac7366b8af99d398ac09b492275"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.16/rkat-mcp-0.8.16-x86_64-apple-darwin.tar.gz"
    sha256 "cf17f1aca3f989511470f4b21e74b54a514ee9dbcdbbe9b337cc3326ded1948f"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.16/rkat-0.8.16-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1f36d09a9d19662e97319e6fb74ff854f5dc1d204351e3e0ddff62a282b08a74"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.16/rkat-rpc-0.8.16-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "73996add0bc95b991da70ac6c2269f9619ca7ba7ef8234490901119ccdb8b4fa"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.16/rkat-rest-0.8.16-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "33383ea0b5eea87bf8a5f1052f3136cb0704700b9650ab06e194d694fe85ef9e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.16/rkat-mcp-0.8.16-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "21b92a6a2c6182a02a4df11c2bbd09f88089f794653d12a0b7ffdfcb6c2cb1b1"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.16/rkat-0.8.16-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "149f9574fba3cf45a54c8a1de7f36714b275683b964ae4764a7331f815ead1e5"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.16/rkat-rpc-0.8.16-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0f1ed5a2d278e959cc10ca97d9a699c10a6582316f77bd9bf07bcd4cba13c91f"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.16/rkat-rest-0.8.16-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3f274992b576cc551be703b4872d80768c2383a1321095ac0590b2c36f1e6f52"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.16/rkat-mcp-0.8.16-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a4dfff0438129f7a2779ca8786dcf8b418cfcb3910e6d226f97bb99164a429dc"
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
