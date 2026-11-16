class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.9.15"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.15/rkat-0.9.15-aarch64-apple-darwin.tar.gz"
    sha256 "2898bb28941c2082847fdc2a2ab4e5485da94dbf8a95f1546f5ce9e154ce3275"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.15/rkat-rpc-0.9.15-aarch64-apple-darwin.tar.gz"
    sha256 "20c42c54a1a3f4fc525589af02f401d980261b30d8f911dbff3d30832e95809e"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.15/rkat-rest-0.9.15-aarch64-apple-darwin.tar.gz"
    sha256 "bdf2027bb94ef1a50476acd39797d7a12de425ea0b24efa7e4c44939e8b668a8"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.15/rkat-mcp-0.9.15-aarch64-apple-darwin.tar.gz"
    sha256 "fcd798d84a6d2a2e8b4407eac7756660c6a160dfc70df646eb2704da6b4d619f"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.15/rkat-0.9.15-x86_64-apple-darwin.tar.gz"
    sha256 "d9f90e7dfe45d43221da33e383d93c430e70d201c8438509d28a62584cea40a3"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.15/rkat-rpc-0.9.15-x86_64-apple-darwin.tar.gz"
    sha256 "538d86e7d9af71d33677708de9ee1a4525479d1edc7a4bf5c9a36021f6878115"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.15/rkat-rest-0.9.15-x86_64-apple-darwin.tar.gz"
    sha256 "fe02193f8b4bb9307fd6628b1c22cd8f65d468c3f37172e78e775ec8232834ce"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.15/rkat-mcp-0.9.15-x86_64-apple-darwin.tar.gz"
    sha256 "8c15a5dd4ee5a3ade4c073de9ea466b715e87d193d0f8418f198535ca4cfc1bf"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.15/rkat-0.9.15-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c1b497492f20cc0bef80b27b4a815a7ef478d71008373eb345382a67511c43e7"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.15/rkat-rpc-0.9.15-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d3bf36b822fdb35832a417b153168862469570e30d61a384f50295f0b84cab5c"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.15/rkat-rest-0.9.15-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c227b9fd3653d9a1bfc5783f9daa3f50ca9e446ccee621b25cb7fd2df037e2b1"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.15/rkat-mcp-0.9.15-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5ba50c4190cb5ce9c5401c64309f5514930ea74516df1fee212130b63887e78e"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.15/rkat-0.9.15-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1d583c9303ab205b9a3d00ed9a422bb83ef629a3159a575be31d8644f511498b"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.15/rkat-rpc-0.9.15-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "94dda0757614de0257f58c11eadc6e1ce775c4af183cb9a316260723636adff7"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.15/rkat-rest-0.9.15-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "02de6b10f773d74a9e55d1a91947826d9920310333e0c5d03667e6f1be5503de"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.9.15/rkat-mcp-0.9.15-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b4b2177c7d761dc65ae3b97a38c5be6742a9833f5b24c7b1bb0a04611d99c979"
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
