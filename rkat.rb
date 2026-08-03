class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.13"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.13/rkat-0.8.13-aarch64-apple-darwin.tar.gz"
    sha256 "3baf1f1b725e711e2e1e1a4a95f4dabe1bff05e7e76316d904d91dfeebdcbafd"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.13/rkat-rpc-0.8.13-aarch64-apple-darwin.tar.gz"
    sha256 "ae115883a2ee8cd267b470ad31d6e421d20d7f3297f3510f031de643365f072a"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.13/rkat-rest-0.8.13-aarch64-apple-darwin.tar.gz"
    sha256 "42117d286e18e7582d911ff0ce22c8d4e2eafaadebb600cf89e29be81eb8f63e"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.13/rkat-mcp-0.8.13-aarch64-apple-darwin.tar.gz"
    sha256 "fe7f68f575678e14628f6ee1e8586819f103cd103a1440ca1cc453cd73074273"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.13/rkat-0.8.13-x86_64-apple-darwin.tar.gz"
    sha256 "47711f98403fb4d0bca54d4845112d812b98a4bd17a6d72e8abb7c23d4d1282b"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.13/rkat-rpc-0.8.13-x86_64-apple-darwin.tar.gz"
    sha256 "0f9ff78e7b057b41bac566af7a4de379d4150a2bcb7e7ded15b77c5bb1db02cc"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.13/rkat-rest-0.8.13-x86_64-apple-darwin.tar.gz"
    sha256 "48a9817681a51285a6a8eed5bbe8a810592db3c99447cb4f38c5d286594d3694"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.13/rkat-mcp-0.8.13-x86_64-apple-darwin.tar.gz"
    sha256 "865acbbf1e60da24430668fede80d3c65bf1fb030668779f5ca25b40f7f1fd3e"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.13/rkat-0.8.13-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "427b3bb505195df2c771e28e02eeb18fc450bbfe7de01ee9de6c01c6bc288042"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.13/rkat-rpc-0.8.13-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "19a198f76044f9adf846207521416b223f42117a013d231d0f15b79c2c77d0fc"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.13/rkat-rest-0.8.13-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "51f09152ec7d7762ba9334815c26ad8e8987af055edf21e91414862998cd0f1f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.13/rkat-mcp-0.8.13-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4a496c3675721c72bb7876a84543ac0f02ad26e4f9ccf5a321ea92d25a89913a"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.13/rkat-0.8.13-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5ab445f0a701bd301cbf4f3429c6b6753ca307b68e2495010687257190fc09ab"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.13/rkat-rpc-0.8.13-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "895235b6472772f80ca62a62ab2e9da9a4238bea764aacae29b348ac3f07d0bf"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.13/rkat-rest-0.8.13-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fae4c36c5ff695ab69675b211dee62bcc64844e2b52d44ac7ba5fd87070b6444"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.13/rkat-mcp-0.8.13-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "930b2b265907513653e294b94ac9d0bf69286ec56ef6780c56cf5a3a4f26862a"
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
