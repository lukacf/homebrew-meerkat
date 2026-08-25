class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.28"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.28/rkat-0.8.28-aarch64-apple-darwin.tar.gz"
    sha256 "49ff7bc0ca79faffdfeed5ad1546b576d8ce0701179040361bd6163774fa7bac"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.28/rkat-rpc-0.8.28-aarch64-apple-darwin.tar.gz"
    sha256 "4560662c1e2bcfd7eea1d806561a3eaa65d23d0bb6b00984a6fd6dcedb1fc1df"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.28/rkat-rest-0.8.28-aarch64-apple-darwin.tar.gz"
    sha256 "13ce2457aefa4fdd44664d203078986e8999fe00f7b23d8704862df27716c34f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.28/rkat-mcp-0.8.28-aarch64-apple-darwin.tar.gz"
    sha256 "89bceee4e56d0076eff1a19d3a7e8aebde70dd08a21ba19df0acd2b05c4adcc5"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.28/rkat-0.8.28-x86_64-apple-darwin.tar.gz"
    sha256 "d86e0260e46aade2b8663335e8acbd93be196a44e28c21cff19e4992c15854fc"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.28/rkat-rpc-0.8.28-x86_64-apple-darwin.tar.gz"
    sha256 "3e1b7d942eb968d49cff233620250c9eee263305a75c958fc11b4f9f633d2542"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.28/rkat-rest-0.8.28-x86_64-apple-darwin.tar.gz"
    sha256 "cea1fcf98fedc37bfa8f043c2d4254c3af969fbdb2e0bdacd1292254acaafdc1"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.28/rkat-mcp-0.8.28-x86_64-apple-darwin.tar.gz"
    sha256 "ef1a36f36ef8b6dc1ce1fcd307fc4dbb12cb5e7710131c8cef9719bda0ad9a4f"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.28/rkat-0.8.28-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f796436cee50c070063d47b9ae32f170ac9bdf455a5b14226c709c8bd2628d64"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.28/rkat-rpc-0.8.28-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a56382d01817d90f29eb7f2af7960d703b940a415ba713f36e2b1bcfa825a01a"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.28/rkat-rest-0.8.28-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5d7dd318a6326484b766dc716abb598215625bea3a6d000377a110b30f1aed4f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.28/rkat-mcp-0.8.28-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e79b172f69b442bf4201d25ecfc9e70700b2a79c164ad8b0bb644f40964ddc9b"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.28/rkat-0.8.28-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "37f3033d55d2589e2fa812d901b0021d1d3c6c5c593f09cf3850ed29f1c4140f"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.28/rkat-rpc-0.8.28-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "36d8214010aaa941abd7ff6895aa47b7c521fcfc7328a32a3651428b2c9d23bf"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.28/rkat-rest-0.8.28-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "28e7a319867d0ade5150ead827c6309fd429476cc66f0c2ef35c303270a487a1"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.28/rkat-mcp-0.8.28-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0628ca9523648e5cfd380c9507f7366efe36bc63e3ce19023a855cbdf26e518a"
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
