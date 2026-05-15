class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.11"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.11/rkat-0.6.11-aarch64-apple-darwin.tar.gz"
    sha256 "2921c4a0ce577ee80169b71c3991539bbd32352f737324a721d9cca2d4e17d1d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.11/rkat-rpc-0.6.11-aarch64-apple-darwin.tar.gz"
    sha256 "771eb59b6b6e9eb0f702fb5c1430cad9700fc11e2b9bd15217af4c0f9004d3bb"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.11/rkat-rest-0.6.11-aarch64-apple-darwin.tar.gz"
    sha256 "2c7a71bcaa8b87116b2f50b42dc207334dbfa73d1c63aa2211ee3910c1774282"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.11/rkat-mcp-0.6.11-aarch64-apple-darwin.tar.gz"
    sha256 "643e19008cd4aceb3c4aa975b8e7ad01c5967f24f872081b4e447d57753c85bf"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.11/rkat-0.6.11-x86_64-apple-darwin.tar.gz"
    sha256 "886e6009bdd44cd2d73f3de835f2cf4131f964fc87406a8699ea614a0890f40d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.11/rkat-rpc-0.6.11-x86_64-apple-darwin.tar.gz"
    sha256 "94fa086f4f7c4e8cd8f973cfb95005d2dd8b17638aa18b0ffb19fcdbbfd2d54e"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.11/rkat-rest-0.6.11-x86_64-apple-darwin.tar.gz"
    sha256 "5668d1afc676528601b4c31075b4f41e588668863611426f3e1942a725b0f445"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.11/rkat-mcp-0.6.11-x86_64-apple-darwin.tar.gz"
    sha256 "d520eddc53f94044110ec02dd17c05769d7fccd94659b795cb6a11e24591fe43"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.11/rkat-0.6.11-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "cce713d2f64c6c0033c0be2a9409734528bcd468b4297ce3ff2f97d3eb59ed75"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.11/rkat-rpc-0.6.11-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "17e80766ee95a783df595fe30fe370657a60c6bbfe27dafb516ccbcadfc0949c"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.11/rkat-rest-0.6.11-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "22c447565561cf8b8439e450d81761d645f2f30690b7a4ec4c0bd48eb31e2905"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.11/rkat-mcp-0.6.11-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c651047de8b5dc6f0c0169cd6a85839e3df7916e4dfe0e730ef0f45ca03cf49e"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.11/rkat-0.6.11-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ca45ad10a07fd0cc861e2941ca4845c7ffc5b3bf9177bb8c2a7fc6dfca9c4d4f"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.11/rkat-rpc-0.6.11-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ef965fb2bf8f6cf98a72058bac3755784c559f6db19de4b4cb82341eb1209c52"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.11/rkat-rest-0.6.11-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7ac7dcb1e7e82c11ba4f260e7515d4e5213d1f79f78b8d584b2a49163ad04704"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.11/rkat-mcp-0.6.11-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "10d005a93cb23693764a4c4ee84d59b05dd6d7cdc85a9fa0ae1fee12f3b35462"
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
