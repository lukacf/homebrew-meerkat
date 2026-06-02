class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.31"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.31/rkat-0.6.31-aarch64-apple-darwin.tar.gz"
    sha256 "9b12131642b5fd81ba46fd283530f5000a651cc21d2b4df97be4bafd9ed7b689"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.31/rkat-rpc-0.6.31-aarch64-apple-darwin.tar.gz"
    sha256 "81566f3b60a6f0ddb069f4bfb6a6590c2874ed4ffdbc6a3965933c3cb9119827"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.31/rkat-rest-0.6.31-aarch64-apple-darwin.tar.gz"
    sha256 "efc51230f61028b5ec0ca3545a3af4be7bc664c4be39a2aaa580f3506a217005"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.31/rkat-mcp-0.6.31-aarch64-apple-darwin.tar.gz"
    sha256 "a665c4cee06ba972861aefe75adb6c3c2e61ef24d48a2b1d1c254ae8c7f2dcc8"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.31/rkat-0.6.31-x86_64-apple-darwin.tar.gz"
    sha256 "79765df85350062fbe2720098d71983210861933fa1c2c9e061e5256718f0aff"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.31/rkat-rpc-0.6.31-x86_64-apple-darwin.tar.gz"
    sha256 "c86a62ddd8de150792bd9b15610dd978a879952bc9216655beb4cffbd062ae7f"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.31/rkat-rest-0.6.31-x86_64-apple-darwin.tar.gz"
    sha256 "8a3098f9662c034a0460095aa1f939f183bf49747129b283b3a132fb03357afa"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.31/rkat-mcp-0.6.31-x86_64-apple-darwin.tar.gz"
    sha256 "9fccaaf3a16d7716424447ad61dab44affd188d7d4ba64338f641af9ce346476"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.31/rkat-0.6.31-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8917a5138000201d23e9cac38b5d1f202bb3994be7487891446b24baa36550f6"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.31/rkat-rpc-0.6.31-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "41b5f68b5b1603c4585f696d125a53e09a5e0de53de330640b6182d38ef235eb"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.31/rkat-rest-0.6.31-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f4ac50abf90d8162bebd865e9f03a40e317f12980a8474d36df5a553a5e4523f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.31/rkat-mcp-0.6.31-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5e39be5d99bde92948ca8eec2e65a1821704e9e1cee6d20b44401b6c0e0efdc5"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.31/rkat-0.6.31-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "bdddd90336a632eb3e1e30f8a456ef4b34e87540d790bbbc4a9a26e1c7744d7a"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.31/rkat-rpc-0.6.31-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "20382fa90ea4a110e2be75886708c7885ed72924c40f35446e7489324de4ab1e"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.31/rkat-rest-0.6.31-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5ba49d245e1a38c872b229bbfb50ce7f185d019f0de1d45b4b32338db519f516"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.31/rkat-mcp-0.6.31-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5979c34897f4d5dd4195e927d51261d0cb352551d3da3ecc2c0940ede6699b5e"
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
