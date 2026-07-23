class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.4"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.4/rkat-0.8.4-aarch64-apple-darwin.tar.gz"
    sha256 "b54d70aedcb38010d2be61231798ce280b9bb219820f55118fa03ddcac8bff16"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.4/rkat-rpc-0.8.4-aarch64-apple-darwin.tar.gz"
    sha256 "ec082352dc701d61d5bbb5232c1b0100f4ef89dca7eb2151dc3afc0629dd269f"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.4/rkat-rest-0.8.4-aarch64-apple-darwin.tar.gz"
    sha256 "96f441a3df79c90555668a0e28973e5a0e8abf1a3cd8a6126e8f556175ee6433"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.4/rkat-mcp-0.8.4-aarch64-apple-darwin.tar.gz"
    sha256 "789570cb5b939e5ef443ddfef7fbbb92bc14eda16216692aa44a9b4bf6b925ee"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.4/rkat-0.8.4-x86_64-apple-darwin.tar.gz"
    sha256 "585b260ca37095fa47a2e63d81d51a994d581252d3b69f6b90a377df9cceaaa7"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.4/rkat-rpc-0.8.4-x86_64-apple-darwin.tar.gz"
    sha256 "4d68f596da2e65e591e9fb20e2a705df90f1558946848beb67376dacdb0f629c"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.4/rkat-rest-0.8.4-x86_64-apple-darwin.tar.gz"
    sha256 "334236fcb055f6826f43c28f1e9c596d7273654aac1513bfb16fc8404ce25d4f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.4/rkat-mcp-0.8.4-x86_64-apple-darwin.tar.gz"
    sha256 "ef4c0d9a38d8176fa95c9091c3dcd6bd094ca9295b5f3bb3a185aca42b7aaf8d"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.4/rkat-0.8.4-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0f358dbaf0053694eadb33f6532ae54767bf202417b52a60e4a004f6822387c6"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.4/rkat-rpc-0.8.4-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "063c3fdec4a00fe7a0b33c5d8d700a03380e4d6de87d4f2388d87bd443c6c724"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.4/rkat-rest-0.8.4-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a60c65b2d72bc49c4aa966da98f887e94afeed469b11659971953afa6f6ddabd"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.4/rkat-mcp-0.8.4-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a4d490c3616465deb6f297331add178319f3efd14b5670bb64f56e60133719de"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.4/rkat-0.8.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d831bc2799b34e1028ffdec4ad9b15bc047370cabd481e409ab2f980f08d07a0"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.4/rkat-rpc-0.8.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "527cd2d0288747278b6e1d08db9337cd3eb7179c75af4bf04d81500d6d4482a6"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.4/rkat-rest-0.8.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fc63842a4a61abb01f89b131ee456df2e6ee624f5e1d2fcee296253b21121ee0"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.4/rkat-mcp-0.8.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c6893031a01708c4fa1a79135523587490957262c0eed34523c75b3056f8ad00"
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
