class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.23"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.23/rkat-0.8.23-aarch64-apple-darwin.tar.gz"
    sha256 "4e095066dc137d13c0696d7b7a8ad0ff3355b772be61644901a6d6b155f74cc2"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.23/rkat-rpc-0.8.23-aarch64-apple-darwin.tar.gz"
    sha256 "0576169ab36910ee8d1beb2a636a93a7c158067dae6b2bb305ab0567c3cd7673"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.23/rkat-rest-0.8.23-aarch64-apple-darwin.tar.gz"
    sha256 "6ec6e75ce556b8bd3c9cbfb711884429386bdfb2ef7c39426b0f3a85499574b7"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.23/rkat-mcp-0.8.23-aarch64-apple-darwin.tar.gz"
    sha256 "528337b58c02ae407d0ac09248748b1f85be1c1be254cfb6cf56b79953980691"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.23/rkat-0.8.23-x86_64-apple-darwin.tar.gz"
    sha256 "689ddba239cfdfadb4ac58920ed5886aa9da0762df4c897edaa604f0413fbbde"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.23/rkat-rpc-0.8.23-x86_64-apple-darwin.tar.gz"
    sha256 "89b339468f274f831f8a93a79918446c1d26256e2fbba43cb049182ddf0c3278"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.23/rkat-rest-0.8.23-x86_64-apple-darwin.tar.gz"
    sha256 "67e500a9eac10efca0c59d5a71d346ab9da4d2f3ed7ae4b294dfd94c161fe450"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.23/rkat-mcp-0.8.23-x86_64-apple-darwin.tar.gz"
    sha256 "3d353d1192b4a26b61a3227a1626ca75084ad5215672e8007fc452130d257135"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.23/rkat-0.8.23-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "863afc430939f59b22241bccb1070366b5d9ce5674209ad570f4efd61aff216b"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.23/rkat-rpc-0.8.23-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7f26d291dca857b384c1a6212060257d1759647fb16b4b4e6717500c9082f1b9"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.23/rkat-rest-0.8.23-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c2a6811d41b6fd7f0e4f648c98d2fa8443fdaf0ddc0bcc80bffda3cae57c25a3"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.23/rkat-mcp-0.8.23-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "008286b20e80352fcf88e88990258d90af4e5e03f21de252eee62637001c3378"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.23/rkat-0.8.23-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "016c2be44ab74acba797ed4fed0d0e9ef35a0333c408ab67250d00326abdce21"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.23/rkat-rpc-0.8.23-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "543bf4fb73d54dd05901fc9d75947d61d303fa957a8e31f80e3858c141f73654"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.23/rkat-rest-0.8.23-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cc797f7d172c38b688e6f51c2fd51b7b543df8d7b0bcf10ad9e08e184d24b679"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.23/rkat-mcp-0.8.23-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9be3cb823b693a4464e8a2ec290450ec91997aca58bc14f857acb7ec56f7da16"
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
