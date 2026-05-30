# typed: false
# frozen_string_literal: true

class Lazyssh < Formula
  desc "Keyboard-driven SSH manager and dual-pane SFTP file browser for the terminal"
  homepage "https://github.com/Bestigor89/lazyssh"
  version "1.1.1"
  license "PolyForm-Noncommercial-1.0.0"

  # Prebuilt bottles — brew pours these and skips the Xcode check entirely.
  bottle do
    root_url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e2461a87e59b0fc98579bb2c3325f6039d0f7d8e69cde1ad01c3ab6bca247cbf"
    sha256 cellar: :any_skip_relocation, sequoia:       "d6f30bc2f759bae42043946b2ca91cd1a36f925dfd7b6689d98a9df74dcc827d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "24b1953bbcf60d983c5ea18cda3be727fa3b10be31aa2eb512099d15c045503a"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "623374bb5317e4a083459778ad3eb2ea8165aadc72d2dbd92ae1cf30b543ed8a"
  end

  # Source archives — used only when building from source (--build-from-source).
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.1/lazyssh_1.1.1_darwin_arm64.tar.gz"
    sha256 "67f34e8c97fbda097824134b31cb0711c85ef1ce4de4188024cc28818e84d6ba"
  elsif OS.mac?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.1/lazyssh_1.1.1_darwin_amd64.tar.gz"
    sha256 "fb83af0eeb59a2867a27987286ebb1bf4e161de1d458621a8019ee7221961155"
  elsif Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.1/lazyssh_1.1.1_linux_arm64.tar.gz"
    sha256 "f9492ebaa741c9ec8d5bbd06b4b0f6e57ef36ffc67fb8da539b0ce7f16ecd08b"
  else
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.1/lazyssh_1.1.1_linux_amd64.tar.gz"
    sha256 "ebac19e9259e5889f94ef8a778205eaddb4672f5baeb59419de16de4fdeeebc4"
  end

  def install
    bin.install "lazyssh"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/lazyssh --version")
  end
end
