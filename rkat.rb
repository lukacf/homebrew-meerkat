class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.7.11"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.11/rkat-0.7.11-aarch64-apple-darwin.tar.gz"
    sha256 "1952a9e8b733022fe3a84ed335a858ed18eb2b014a344da9257b46c3ff2f095a"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.11/rkat-rpc-0.7.11-aarch64-apple-darwin.tar.gz"
    sha256 "29a14aeb69302e3c494ee946ced3e6c270105c8c07654669e33c27fd6f2247c6"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.11/rkat-rest-0.7.11-aarch64-apple-darwin.tar.gz"
    sha256 "09f58bafd06bbe6ca793deb0e5679290917f16a3d74ff5c3fbedc8865216e053"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.11/rkat-mcp-0.7.11-aarch64-apple-darwin.tar.gz"
    sha256 "56bc9aa296a45bc6fcf852dc82d37523bd1883fcac67adf98d9fd2a24931b3f7"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.11/rkat-0.7.11-x86_64-apple-darwin.tar.gz"
    sha256 "eb5313557a0da961f8106a2fef86721b4c7119e63a3ac6c37c7e26941403f139"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.11/rkat-rpc-0.7.11-x86_64-apple-darwin.tar.gz"
    sha256 "c72c6fe1f5f65f6e5fad98f7b7947be4317c7e244f1d03a8c5c9293f71ce9ff5"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.11/rkat-rest-0.7.11-x86_64-apple-darwin.tar.gz"
    sha256 "fbfdbddbc02312fa4ab08ecb0abccbabf4b0aecac43cee539db2348896639950"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.11/rkat-mcp-0.7.11-x86_64-apple-darwin.tar.gz"
    sha256 "e4ee9a33931fc243410b94a622502b2a4bdc40e98daed636dadbc256612241e0"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.11/rkat-0.7.11-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2fa7ddad61a04039f7b84f4e7fe63198f0d02e0c2ee3db29c74e73954fb778d2"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.11/rkat-rpc-0.7.11-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6029a93a1a5cc5c1735c76dcf81da9033366236b4b5222ca147a788e8160082b"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.11/rkat-rest-0.7.11-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "588d24de8d9b509047a910ec1554c8056ecf23adc3e901da80d384696f603de8"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.11/rkat-mcp-0.7.11-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "78d61ae0540f0376d261438ca52eb0aee9c1f7b9cf1ca30137aed557fdaedfb0"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.11/rkat-0.7.11-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b0483c770f194d54e9343255b6fa8eee5853e3be10c0d5052cc9b05f339aa723"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.11/rkat-rpc-0.7.11-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4c4ae7bee3857cce2fc297fd7625d9a4d369f811b402956d7c6b1780f5318463"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.11/rkat-rest-0.7.11-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "243ca051246f1fbcfec4b2979fc9f8a217ae2790a4db546f8c9f46ef45608466"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.7.11/rkat-mcp-0.7.11-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "62251349278de362bc6a08d47f9905f0a44daa2e07bf33ce72179ded3d1db9be"
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
