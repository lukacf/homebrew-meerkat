class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.15"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.15/rkat-0.8.15-aarch64-apple-darwin.tar.gz"
    sha256 "31db2cae0a3e1ad403f77af920abbc3874294af22e1182bb0f749d946b78361f"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.15/rkat-rpc-0.8.15-aarch64-apple-darwin.tar.gz"
    sha256 "0a70ae9ae5695f7a6536be6f34c34c13e6fff4748840923060518b2de4d72582"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.15/rkat-rest-0.8.15-aarch64-apple-darwin.tar.gz"
    sha256 "b96ab54ea0b215cbe54f3bc91d84e081772525f367f591575f0659cacd2ab972"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.15/rkat-mcp-0.8.15-aarch64-apple-darwin.tar.gz"
    sha256 "a4326153cf1b8706b4f408b6de71b2581a7dbf9b289a78c7e3352a7572cac95f"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.15/rkat-0.8.15-x86_64-apple-darwin.tar.gz"
    sha256 "d866c3606ca34d054e18121e3926f9b0783ea063c3d99442d4f442c86fff9546"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.15/rkat-rpc-0.8.15-x86_64-apple-darwin.tar.gz"
    sha256 "abe740f952e8a6b4d46a53a02b1c80fb31e650e5414e1ddeb4c8f8550e3b9e07"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.15/rkat-rest-0.8.15-x86_64-apple-darwin.tar.gz"
    sha256 "c0047dba15e5d86b1ddfab39b5a88d16e6fb72a3977a7c7b68db629ef76ff1f0"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.15/rkat-mcp-0.8.15-x86_64-apple-darwin.tar.gz"
    sha256 "38f9c675f86ba7afc76278571b17fbc04e9d478130cb16589a7fe226e77d1613"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.15/rkat-0.8.15-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6977f2ed5227edfe481c82e247c2a5e948f61391a574d6f880506d24c171a671"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.15/rkat-rpc-0.8.15-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "103a9d944f012432767d06951c42b1291a2de6621ed423b0be335c7e37c672d0"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.15/rkat-rest-0.8.15-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5b6578c2ffeee7e1f1027d2dfa611c3a44838540860d0edf30115477e13dabca"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.15/rkat-mcp-0.8.15-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "41a1ba96d5fd4691c8e5594fc32f73716eb33b52f794818d235b85fa119ca0f6"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.15/rkat-0.8.15-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1eb522e971842093603e31b6e10308eb2f8d5847213b3874733ded4c7e055d69"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.15/rkat-rpc-0.8.15-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8eb3727873d49d11ea24cdb82e25bf8d7a5fcaa63fdaa4cae79c5f3d95de3a4a"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.15/rkat-rest-0.8.15-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bcd8aab2b572080a48b3edbac35e491fd5a57d6166d2aa6a8d153287cfea03bf"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.15/rkat-mcp-0.8.15-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a86c6144c16b03d03da839c0280cd4d06d98bd78da9c0911ee11e4e117f418c0"
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
