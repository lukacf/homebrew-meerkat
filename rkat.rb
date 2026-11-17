class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.9.16"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.16/rkat-0.9.16-aarch64-apple-darwin.tar.gz"
    sha256 "cc919a581f0a490aabc41c40af08040a73356383246ac0df16b51c281b539289"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.16/rkat-rpc-0.9.16-aarch64-apple-darwin.tar.gz"
    sha256 "909d520ed04d6f699819753dfcde680ab42d6ccb123ae60f8747a2aa0f245324"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.16/rkat-rest-0.9.16-aarch64-apple-darwin.tar.gz"
    sha256 "108e43351a311ac07166d80a2b9dad3ad6092d6855708fdacbe221da6c31f0e1"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.16/rkat-mcp-0.9.16-aarch64-apple-darwin.tar.gz"
    sha256 "806d09fa2f93a131b9baf272eca03310e03ff4692bac9f2245dfb5d8a0391b0a"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.16/rkat-0.9.16-x86_64-apple-darwin.tar.gz"
    sha256 "3aa3207d37ec144b4aa8cd34d4c4afc08823d2f379d0227648d4de769a760f5c"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.16/rkat-rpc-0.9.16-x86_64-apple-darwin.tar.gz"
    sha256 "92dc5f521480d6b4401316d0edab40fc31bc93e961769454e74150ff10a4eb7a"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.16/rkat-rest-0.9.16-x86_64-apple-darwin.tar.gz"
    sha256 "d273abca7b070508a8aa569f01605a5a1974ecb430d1d607944295ea62729b72"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.16/rkat-mcp-0.9.16-x86_64-apple-darwin.tar.gz"
    sha256 "f401ad8504012e8567b261feb610c9ec591ae1db7b88dfd125566696d443df1c"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.16/rkat-0.9.16-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6c3577b8dade1cd0b00bcd6347dcda5d28d9926701a94b799b74e255065910c1"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.16/rkat-rpc-0.9.16-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a615d2d5f440389ae165b7792c37ed0e08a8f0e4a93a01b9d4b31d180ed1f23c"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.16/rkat-rest-0.9.16-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "057ac0296ded688a7f98b5b15ba51d48d7f340cb89af406d979f5e4c37cd1e4c"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.16/rkat-mcp-0.9.16-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "00ba19cb848bac67dc84b1917c1954819368186803a351919cadb0b0a8edbe3c"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.16/rkat-0.9.16-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ec3090f2bb0a3b825e427a449a0556b5083be616dfc9906f8a2e4cbc265ffab6"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.16/rkat-rpc-0.9.16-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "634d675cd32f79caba184320a1960ebcd47d3b8fb64656a28712e7f29904857d"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.16/rkat-rest-0.9.16-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "16c5666771aa036b12759f039379a7c385b9d50bf28c3441f4b584da99b7a4dd"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.16/rkat-mcp-0.9.16-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "596febc7745ffde0fcb6808091089caf7800bc72b9d199136f121854dd1b8082"
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
