class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.8.34"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.34/rkat-0.8.34-aarch64-apple-darwin.tar.gz"
    sha256 "af8798b18b2bed8b50823c20a1afadb4842e7abeceb33ea5a2d43ad69f238db4"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.34/rkat-rpc-0.8.34-aarch64-apple-darwin.tar.gz"
    sha256 "414f054a07b549d64a7820ba5e14080208f640d5bad92a5a0723416757bdd360"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.34/rkat-rest-0.8.34-aarch64-apple-darwin.tar.gz"
    sha256 "216a137f5a6aec217f424be3525cc91fc592bc742710a70b03e15283b3a9d025"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.34/rkat-mcp-0.8.34-aarch64-apple-darwin.tar.gz"
    sha256 "ef5dea6f766be0135238098ae0b81da01f7f57536054b726c0098dab45a1d7e1"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.34/rkat-0.8.34-x86_64-apple-darwin.tar.gz"
    sha256 "b86595e9ed3103c044f07a4de63a8d4216f20e82ce584f7c8c8fe7e8c63358ea"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.34/rkat-rpc-0.8.34-x86_64-apple-darwin.tar.gz"
    sha256 "1a7c24ca01fa4a3428c4e9518daac95b7bfb6ff41062ac9f01d362c1bf2b6721"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.34/rkat-rest-0.8.34-x86_64-apple-darwin.tar.gz"
    sha256 "d2a4d5060ae2e656214f59588e65c7fedc84fd0576eb0792ff08e2ae358be2e2"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.34/rkat-mcp-0.8.34-x86_64-apple-darwin.tar.gz"
    sha256 "d33a4f1fca0453d4bc7c6dad22d68ea59c0b6289a0535d9c222670641d682431"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.34/rkat-0.8.34-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e3a95418f9d53d8642ab972b96e330e146d134e50d4c3cd1b8060593f08cf618"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.34/rkat-rpc-0.8.34-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6d2d29de82a45d72cd94b73f9da0ab5703493a97435088651af89fc04c767e89"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.34/rkat-rest-0.8.34-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ab76386fd7125b9df1c1ba246888a83b6593dea0ddaebae3dc28142263630360"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.34/rkat-mcp-0.8.34-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "07259ccb5d9ff39055a1c7880fd5b065648931ca6b16be87200709ec6fd69dc6"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.34/rkat-0.8.34-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0ccaa0e55e9b813648ba50891468e1747b68c2d3d6cf9445366f5d19c1803588"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.34/rkat-rpc-0.8.34-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a476239bf9a97804958769ef239a8d485a876694197f1c21781a843c08da5e7d"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.34/rkat-rest-0.8.34-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "479044ea7e42a12c4a209637b0b0adf09dadbb2b7e5ebdcfe60b720cf3bba2d2"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.8.34/rkat-mcp-0.8.34-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8709aa49288484ea47b1468c9589b5f1714748860bd532f7ac9742978bc1e628"
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
