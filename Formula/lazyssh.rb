# typed: false
# frozen_string_literal: true

class Lazyssh < Formula
  desc "Keyboard-driven SSH manager and dual-pane SFTP file browser for the terminal"
  homepage "https://github.com/Bestigor89/lazyssh"
  version "1.1.356"
  license "PolyForm-Noncommercial-1.0.0"

  # Prebuilt bottles — brew pours these and skips the Xcode check entirely.
  bottle do
    root_url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.356"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a2c822bc80576aa2750a91e6de880c89e50d473589f237a7487118cdfb2ce747"
    sha256 cellar: :any_skip_relocation, sequoia:       "3268761ce913384cdbf38308d08467b755a1a8195854191d16647df53bceb0e8"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a0e75cb2306b08a519898900f0998b531e5e3983cc1fb4c229ee9b1e7dcbe594"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "58a9643f5d50b2c7226774ced3ea2ffbfe21e236820d20ec5aece33431adae37"
  end

  # Source archives — used only when building from source (--build-from-source).
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.356/lazyssh_1.1.356_darwin_arm64.tar.gz"
    sha256 "8be115c08f60c76c8533a223da5aeecc4cfc273ddc2382d7b22e9de3373dc931"
  elsif OS.mac?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.356/lazyssh_1.1.356_darwin_amd64.tar.gz"
    sha256 "0c1ce7db6097b9094efc39a6247377e237235e886d1dacff29c9ec1c5abe5de7"
  elsif Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.356/lazyssh_1.1.356_linux_arm64.tar.gz"
    sha256 "d754b78c69eb30c15b833bfe015e452013780968bf7b6812b6848904f6eb5544"
  else
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.356/lazyssh_1.1.356_linux_amd64.tar.gz"
    sha256 "f2580d797007c1861bc79af8664368fe7526c4055f0ce7ede583547a7589f9ef"
  end

  def install
    bin.install "lazyssh"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/lazyssh --version")
  end
end
