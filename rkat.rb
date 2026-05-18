class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.17"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.17/rkat-0.6.17-aarch64-apple-darwin.tar.gz"
    sha256 "4297b41a39e5a241d6bc2f6f0572858d2a336e9e47b23607ddc9cfde27659896"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.17/rkat-rpc-0.6.17-aarch64-apple-darwin.tar.gz"
    sha256 "f2d79dfd4ac53cb126a43f3793fcef8f1bf1e4ab85df87fe892b1acfc7a9f2e3"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.17/rkat-rest-0.6.17-aarch64-apple-darwin.tar.gz"
    sha256 "4944e8d91c816d5070b9e84b2e7238cffb66c966fe1fbc4c96f762d233b2b04c"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.17/rkat-mcp-0.6.17-aarch64-apple-darwin.tar.gz"
    sha256 "823f31b13cc249d3e0e6740b354d1c4a0a137ff87ce714c16f71c77f49c29764"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.17/rkat-0.6.17-x86_64-apple-darwin.tar.gz"
    sha256 "082cf5d1baf56aec6196bee6011112419381463f3af4a50fd99bf8a0db7916d3"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.17/rkat-rpc-0.6.17-x86_64-apple-darwin.tar.gz"
    sha256 "5b4ab275edc93bdc06073bdab574dd9aa6896fd4f472cade88dbe24c1340b7d3"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.17/rkat-rest-0.6.17-x86_64-apple-darwin.tar.gz"
    sha256 "e77d6233487e3aaa2586f4cf50788f468f339050ce0783013c532a30048db72c"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.17/rkat-mcp-0.6.17-x86_64-apple-darwin.tar.gz"
    sha256 "fc52a1a898834583b942a056bd82865ef81dc7b97b78024e87ec5af260ee0705"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.17/rkat-0.6.17-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1f2497e02ed8ac0c1e8438f91a1ee06bdff1c4e2d0d6ccd5e72f0926e4bee898"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.17/rkat-rpc-0.6.17-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "26e3cdfe154a23b10589a0c98e0f80f31dfc682e1180c86b8a7f11f8831bbf88"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.17/rkat-rest-0.6.17-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "58f4182cfdfd0f3efce2ee12a3cd70be932a1034586602433a3eabfa2802c159"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.17/rkat-mcp-0.6.17-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f6d373fb00bcff0422cfd3871af29ab54473769d4afe551b643e79165aff3c99"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.17/rkat-0.6.17-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cdd8e807839ef46af547aeb8f38e58ee6cc68ae3871b9ea3d7437916c2405e8a"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.17/rkat-rpc-0.6.17-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "638a4438fb4c10961009ce41b53795a1945701fb80268e0cf8d55a1b72cb39d7"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.17/rkat-rest-0.6.17-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fe292079708651807cdba07c6ab82162cc7d2988b6302c08f6c79e076a351a81"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.17/rkat-mcp-0.6.17-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2353a4f4169828d1b0a7e970f73ae1f9a7c917fad10cd68939bfc26f9a75258e"
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
