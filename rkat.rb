class Rkat < Formula
  desc "Minimal, high-performance agent harness for LLM-powered applications"
  homepage "https://github.com/lukacf/meerkat"
  version "0.6.5"
  license "MIT"

  on_macos do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.5/rkat-0.6.5-aarch64-apple-darwin.tar.gz"
    sha256 "df1ea7f574a1e1a7f36ebcf22204ee383d48afeff33210a3a0d4e5fca54a7d9c"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.5/rkat-rpc-0.6.5-aarch64-apple-darwin.tar.gz"
    sha256 "471b523caa852529c4db3a0acbe944dd372c8ea9cf7065b72288bfb556b15f41"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.5/rkat-rest-0.6.5-aarch64-apple-darwin.tar.gz"
    sha256 "88ad9ee70abd5240e86f3b3fb1ae9fb4e829537f7bd55bca0d0c499b38c92b25"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.5/rkat-mcp-0.6.5-aarch64-apple-darwin.tar.gz"
    sha256 "13bdaba5b24a64a1330092f5463b6fd9e9fe266ac41bdf793d7a1ba5ce85ca3e"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.5/rkat-0.6.5-x86_64-apple-darwin.tar.gz"
    sha256 "e31ac0f919ab801c60899cb5d62faa6fac0c237bb979c41260d41b03f78ed993"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.5/rkat-rpc-0.6.5-x86_64-apple-darwin.tar.gz"
    sha256 "84298f31bf7ecb5bf5fceac5b633d2aff98245883d708c1ff19fca344346a473"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.5/rkat-rest-0.6.5-x86_64-apple-darwin.tar.gz"
    sha256 "28b586a995157c6567af6d4c6e7ed074864c727f63489bfe143b3e9c451984a8"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.5/rkat-mcp-0.6.5-x86_64-apple-darwin.tar.gz"
    sha256 "7694ca8bd47c32fe064bac6db47eadbfe17886bb5b6d7ef767f0390178c7ff64"
  end

    end
  end

  on_linux do
    on_arm do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.5/rkat-0.6.5-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2a8c35ce77f72bfbe26d83752a5515e5fc1d516ed0a7099cdad581b0782dd7a2"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.5/rkat-rpc-0.6.5-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5ed4571b6f94d567d7862bdd10e22b8f1a7fbbb8cd31234dc252a1a89030e809"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.5/rkat-rest-0.6.5-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7777bab3974db99a27317e3dfb6dcbf2a8038be4d1d94f810988d6349be7c72f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.5/rkat-mcp-0.6.5-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "54ac635ae6480697be009d20e4f468a08d29aaa1507ac303c96ed4c403041bc3"
  end

    end

    on_intel do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.5/rkat-0.6.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0472cf5f9e29656640f972958f1cff226aae1fed21f0b4061ff25971de68dc27"

  resource "rkat-rpc" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.5/rkat-rpc-0.6.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2fe1ebcf2dee279352af3ec31cd5de61978e05f4ed975c0c106ac5a5dc4783b6"
  end

  resource "rkat-rest" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.5/rkat-rest-0.6.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a540bbce10ab50ec814c6d58cc4b90a3af48691308a7f76ae1281296922a8a5f"
  end

  resource "rkat-mcp" do
    url "https://github.com/lukacf/meerkat/releases/download/v0.6.5/rkat-mcp-0.6.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c4195d54e0e5e13b0ce69bdf117132b22f4f209ffe23b6f86ce2f29a97d05eb2"
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
