class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.22"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.22/rkat-0.6.22-aarch64-apple-darwin.tar.gz"
    sha256 "ff3d5646692b3f42091467a88b847fbf5b6a958ef82bc691c1c0eea3a5514126"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.22/rkat-rpc-0.6.22-aarch64-apple-darwin.tar.gz"
    sha256 "03ea73e0707d772794819714b55f38f547e1c9d394862a7f5206cf9020557e23"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.22/rkat-rest-0.6.22-aarch64-apple-darwin.tar.gz"
    sha256 "041beaac12b8b1b1d27a647d670219464cc5801b136a4ee20e8b9bef5e92ca78"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.22/rkat-mcp-0.6.22-aarch64-apple-darwin.tar.gz"
    sha256 "9fb7129aae0d263116daf1f97520a41acca87558ce0c5bd4da753858886b0155"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.22/rkat-0.6.22-x86_64-apple-darwin.tar.gz"
    sha256 "6ff2ce11f7f34bfa0902c844dd9f1611362a0277e476b02863673068b6de8861"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.22/rkat-rpc-0.6.22-x86_64-apple-darwin.tar.gz"
    sha256 "5b4859f9ed4092d9e87478df42bd2fbd35d27a44de87b1128830562fca013019"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.22/rkat-rest-0.6.22-x86_64-apple-darwin.tar.gz"
    sha256 "cf41940eb2efbbb6f988ded76a5bd7ffd520aca05536a83a94d440e9b1f902d1"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.22/rkat-mcp-0.6.22-x86_64-apple-darwin.tar.gz"
    sha256 "d034605d72b22b848e9d4fae56da6b12cf12fd512bbb0c60adb5e220d4a347ef"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.22/rkat-0.6.22-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0e93c4498723a77756888cfe50a1247fb792c87a3b48e9d5667604aeddda4b6b"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.22/rkat-rpc-0.6.22-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0c2ea60f479b4b5c32d218be8a9244a783764173307178546d5ece5f463e8d8b"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.22/rkat-rest-0.6.22-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0fbc7b034217a5ea9c656c9b1a218a55735fecb9ba9775505028a3f346de7970"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.22/rkat-mcp-0.6.22-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6dd060ab0a1c13cc6fe7079de3c5b5b3aa655b9b664f716fc31d00952c26983e"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.22/rkat-0.6.22-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d3e55011ccece5069bb2b738cc63e92a3e0ba62e8808e08ab3db3539c60a6a10"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.22/rkat-rpc-0.6.22-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3fd7b44b319643bd4b36660a4004c0f77d2224949eca192cf98e169c8a1af61e"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.22/rkat-rest-0.6.22-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8bb787fd53a9cf36d4c9732c8ce2e6f9507a967ba8edb7a853f5fafd6a3d76ea"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.22/rkat-mcp-0.6.22-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a53be10fffa16ad9640220e725e99e846d0c5d63dedf231f0a71f87cdafda813"
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
