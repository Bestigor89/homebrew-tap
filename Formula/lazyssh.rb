# typed: false
# frozen_string_literal: true

class Lazyssh < Formula
  desc "Keyboard-driven SSH manager and dual-pane SFTP file browser for the terminal"
  homepage "https://github.com/Bestigor89/lazyssh"
  version "1.1.0"
  license "PolyForm-Noncommercial-1.0.0"

  # Prebuilt bottles — brew pours these and skips the Xcode check entirely.
  bottle do
    root_url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "01d878e91e9d8585d33a4884aac30a464d699cdfa57ca9216159b1c790fe076a"
    sha256 cellar: :any_skip_relocation, sequoia:       "8ac0d8d4c7c21c03a5d5105fde7c923ee0252401096b7c1451278a8b8c314d24"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "595c5825b8148269a1b21704571fe4fd8be0665635814de61d2a797f9369f050"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "79ae9aa3b32d8e6c0e6f8a5424587b365a4d9c83277d65b557190aabe98917fa"
  end

  # Source archives — used only when building from source (--build-from-source).
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.0/lazyssh_1.1.0_darwin_arm64.tar.gz"
    sha256 "0e1e99ee5f595cad578e1ca9a4564e6fc9a147848f8ea7779ad9e96c1006eeb2"
  elsif OS.mac?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.0/lazyssh_1.1.0_darwin_amd64.tar.gz"
    sha256 "9287bc1de0c4f69515ec84ca8f766ab8f369cfd1031c3fc7e1af2368089aff49"
  elsif Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.0/lazyssh_1.1.0_linux_arm64.tar.gz"
    sha256 "2ad81bc812ed888ee795f017268f2bec8cdcc397a9b9f69813bd00afced0c6a7"
  else
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.0/lazyssh_1.1.0_linux_amd64.tar.gz"
    sha256 "545afa03fb80576bde81fb08ae09de2761ed7c5ecbf85e23887cbf4dd3dccb08"
  end

  def install
    bin.install "lazyssh"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/lazyssh --version")
  end
end
