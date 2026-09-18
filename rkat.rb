class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.40"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.40/rkat-0.8.40-aarch64-apple-darwin.tar.gz"
    sha256 "6c1e359d5be55d368f19ec3a3efd1b161d41583c112ae4b2301ee95d5b68860e"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.40/rkat-rpc-0.8.40-aarch64-apple-darwin.tar.gz"
    sha256 "fce9294dc60a226077649ae2df3de484937850cbec2943291da22a635a951b94"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.40/rkat-rest-0.8.40-aarch64-apple-darwin.tar.gz"
    sha256 "cba2ff19c1be9db7636aa6e324152ed959482906ce8c8c842edb0308e9006816"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.40/rkat-mcp-0.8.40-aarch64-apple-darwin.tar.gz"
    sha256 "a4b8c46569cc5bad4a3011b091fc8f5984623683937003875bcbd4d1ecdf657f"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.40/rkat-0.8.40-x86_64-apple-darwin.tar.gz"
    sha256 "5188232a6f298257ed84b93e5a1f3bd9c5d8b96dc404f77eed607cce25c98703"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.40/rkat-rpc-0.8.40-x86_64-apple-darwin.tar.gz"
    sha256 "cf73e70b7ed46c8a68d9f3c8b0c9197e0e7e1d3b1b8f1cc8a346ffd0ce123a7a"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.40/rkat-rest-0.8.40-x86_64-apple-darwin.tar.gz"
    sha256 "8d84803cc424e94dcbe3bf9c792ce0c9ee761d072463dade238f12ad7b91c730"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.40/rkat-mcp-0.8.40-x86_64-apple-darwin.tar.gz"
    sha256 "319475d4ecd9a897110029f0012298f1b79c3fc9061ec90d4ad6a3fc61c33e31"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.40/rkat-0.8.40-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ce4583a13fdec0674d20bb5d9c84f8e2aa9ef7ed2db27b55c178cd80c6616583"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.40/rkat-rpc-0.8.40-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "89053cc0fe5bc7e736f6d73c63725848b027f3f33c4f037dd6311c21a0ce9563"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.40/rkat-rest-0.8.40-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "95b25b730a2b027b5b88f175011c0e283cb4868ee4f3e611566222398dd065e1"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.40/rkat-mcp-0.8.40-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "64123b08540aa9922ae755da456cc719e6cf98327fa16cb1d03b49a35fb8d230"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.40/rkat-0.8.40-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e5fbb5026fa0aea251954d7e405c2b36b716e124ec3455645dede5ab71d55d6d"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.40/rkat-rpc-0.8.40-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b803226a05b9386ba4bb5f09267a29b34e6aaae92cf2789212c3ffc434f5d532"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.40/rkat-rest-0.8.40-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a997c25a8ce33c5ba0f11b358fac9af084f8c10958b6b23d71fd1c85e2f28930"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.40/rkat-mcp-0.8.40-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c6c97eafd574da8eeac55f720507e822b7ae39dae318cf19690b395828fcaf61"
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
