class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.9.14"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.14/rkat-0.9.14-aarch64-apple-darwin.tar.gz"
    sha256 "24f43d4647c863101414ed520b957c9ee8d1fe5dbf4055cd5a9a725add3ed884"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.14/rkat-rpc-0.9.14-aarch64-apple-darwin.tar.gz"
    sha256 "9e0afd853d56a0ea0445d4e65f5251cce84fe5f78104b23724dc23b5eefdd4ed"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.14/rkat-rest-0.9.14-aarch64-apple-darwin.tar.gz"
    sha256 "213738f5ea2982f3333cece70e5a8ddf64bf2bf496678c9f3d4f09db5dc5bc4a"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.14/rkat-mcp-0.9.14-aarch64-apple-darwin.tar.gz"
    sha256 "a50d91b00c557f102823e2189aca68070371df54d868b046a38321e14a64d866"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.14/rkat-0.9.14-x86_64-apple-darwin.tar.gz"
    sha256 "638b20f7b462ba0cca04986ed76652d404ed51bf4de09b339c682680468d3beb"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.14/rkat-rpc-0.9.14-x86_64-apple-darwin.tar.gz"
    sha256 "62177000b889a19e1f0805959b6afa6e56d37d7b87adb46a8d03a9a78dbd76bc"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.14/rkat-rest-0.9.14-x86_64-apple-darwin.tar.gz"
    sha256 "afaa42f83f310c8f0cc27eac7f7645440191eb227f27f04679293000f6f80537"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.14/rkat-mcp-0.9.14-x86_64-apple-darwin.tar.gz"
    sha256 "d60fba6764dc065395ef3e4702d49d0dc88b13b20bb2c6f0fb746bec7385412a"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.14/rkat-0.9.14-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "785d1b8663173bb6a2a84acc9d293497ddb0e2e5ca333335ea3d5c6dc833c33a"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.14/rkat-rpc-0.9.14-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5c230db411eab7a09b0eb9f234181857bcad26dee28db2ea8cda92597219ae62"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.14/rkat-rest-0.9.14-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c284a492f0df5199a4f59fe9cf93f43d2815df5094b282090a1736661f14edf8"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.14/rkat-mcp-0.9.14-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "b560fd70e9c88f728ce94b6d13460dcfac1856b05a9231255820d42c351ea2a8"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.14/rkat-0.9.14-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1ced4cac9590fc987378a616b2697db2535c4eed469ea5bd5616ba78d980abb0"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.14/rkat-rpc-0.9.14-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5e3fbcd4546eda0dc91d6ef2e9915dbdbc4775843e3fd5b5abb003d79879a641"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.14/rkat-rest-0.9.14-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7998995455a6b58ba5f5933acd69d3ca36d7280dc84d6f9d923d4e1ec0ec3952"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.14/rkat-mcp-0.9.14-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "98dc304f810629324b8e6a8673596b55d8757a8d4cf57233501d840a0375b1b6"
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
