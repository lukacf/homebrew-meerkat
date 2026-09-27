class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.45"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.45/rkat-0.8.45-aarch64-apple-darwin.tar.gz"
    sha256 "086dcdcce918736ca63ced3dbbdb0f06da9acdb5e6b8f6f0e997b2792154d821"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.45/rkat-rpc-0.8.45-aarch64-apple-darwin.tar.gz"
    sha256 "3174bde2e249b73276a6615f41fd942a2cc2cde4b339e97af45d51d7f025216a"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.45/rkat-rest-0.8.45-aarch64-apple-darwin.tar.gz"
    sha256 "cacb4a73f6c68f69ffc6be224a99b7425bb549f7ec2216656b2db3b92c91c7fc"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.45/rkat-mcp-0.8.45-aarch64-apple-darwin.tar.gz"
    sha256 "5a8adf9da9372246ef7462b9f2e3f4b4687c666999df459757bd8200cea8a900"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.45/rkat-0.8.45-x86_64-apple-darwin.tar.gz"
    sha256 "660bfffc2b7481ac66a1ce99ef7eaf589fe47601d1d78d787b671e40960f8cb6"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.45/rkat-rpc-0.8.45-x86_64-apple-darwin.tar.gz"
    sha256 "5c2b38f6f0a63e1436debc5f324b602790b5d51f363cf306776229e018870139"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.45/rkat-rest-0.8.45-x86_64-apple-darwin.tar.gz"
    sha256 "063ad6a4fa0fd211cfd89e4ccfb8334b3b656bb49ea0d79275879dc33e9ba26f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.45/rkat-mcp-0.8.45-x86_64-apple-darwin.tar.gz"
    sha256 "3c3bfa96dde171d7c98e331da31bb9acec31a0eca3b4fc20140cbf269c11e5af"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.45/rkat-0.8.45-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2db863e9ccaf77ead633b1ca024019f1c2f8d5df25d6ecc5c2e99261c6293113"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.45/rkat-rpc-0.8.45-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "94f12fceb948f8b2f07e1be8452299f9cf1f479517bf13d5468351fbcb24fd79"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.45/rkat-rest-0.8.45-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a7ff14130b6684224a6fbbc73ed229812c0dba839f79a2d3b0392f8ed21a2963"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.45/rkat-mcp-0.8.45-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8d5e7a310643e9a0c7ed8bc93355a5392a47ff0ade95270aae76ac6451765d7d"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.45/rkat-0.8.45-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "da8ba5e4fe075df7c77fcb8f1f8528c05184e45cddc810a34706715618aa6ad6"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.45/rkat-rpc-0.8.45-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2e6a6966749b35344d5d58c563a2ce2c29fbd048eeef2a8d23718c846faf0cc5"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.45/rkat-rest-0.8.45-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "84c1483e54e72ede6515bb2bb031f455a231239e5dbdda107703ea8fce1bc2e5"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.45/rkat-mcp-0.8.45-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "dead56e7019cdc880de3ce6954835c7f1bbced31b76953c458a3b0a12f489ddc"
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
