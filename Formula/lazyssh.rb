# typed: false
# frozen_string_literal: true

class Lazyssh < Formula
  desc "Keyboard-driven SSH manager and dual-pane SFTP file browser for the terminal"
  homepage "https://github.com/Bestigor89/lazyssh"
  version "1.1.358"
  license "PolyForm-Noncommercial-1.0.0"

  # Prebuilt bottles — brew pours these and skips the Xcode check entirely.
  bottle do
    root_url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.358"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fface962a96c4906456cd3199b30bfaeee9a8ea977897e59cfc8e1a51495a31c"
    sha256 cellar: :any_skip_relocation, sequoia:       "8115ee0a093d839d00cfa7786abec9be7bf82a85ac853b2a62a08561fbac59b4"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f2ce1d514ea8033107fae28a2c3c820bf3860654d86792d44e7957e88e837b11"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "819db483b532c0d05d8277c1547ff18114cbb5b7bcf321f71c32fb1b2ad21c2b"
  end

  # Source archives — used only when building from source (--build-from-source).
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.358/lazyssh_1.1.358_darwin_arm64.tar.gz"
    sha256 "2e2af858efa3141a7c315effda3dee6453c1fbbddbb540f404f22111db00b7ed"
  elsif OS.mac?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.358/lazyssh_1.1.358_darwin_amd64.tar.gz"
    sha256 "fced867f41bf0c63e1b9baf391de42fd7004ecaa91a2abc0011e4261bf6456c5"
  elsif Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.358/lazyssh_1.1.358_linux_arm64.tar.gz"
    sha256 "95880061bc41e99e23f94dda4065122477eacfa02e3be68accd35a341a74e8ff"
  else
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.358/lazyssh_1.1.358_linux_amd64.tar.gz"
    sha256 "4d0fa04b2397648419c6346a4b96d12f133e16421b03328ea427a4916ac11186"
  end

  def install
    bin.install "lazyssh"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/lazyssh --version")
  end
end
