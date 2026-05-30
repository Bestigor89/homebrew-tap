# typed: false
# frozen_string_literal: true

class Lazyssh < Formula
  desc "Keyboard-driven SSH manager and dual-pane SFTP file browser for the terminal"
  homepage "https://github.com/Bestigor89/lazyssh"
  version "1.0.7"
  license "PolyForm-Noncommercial-1.0.0"

  # Prebuilt bottles — brew pours these and skips the Xcode check entirely.
  bottle do
    root_url "https://github.com/Bestigor89/lazyssh/releases/download/v1.0.7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "13a08dd333d1ba7d8b31d0adabdc04f2a4d06d04b717bc721ec857861a021b19"
    sha256 cellar: :any_skip_relocation, sequoia:       "f4695b7f7f1b062a24ccc0108b1325b18bd2bd811580795cb2a18dd2f69367e4"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5501e85dbf26251f5791207652efb78b7700072e1d1d898a02b60010aa91d7f5"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "c8d78eea9e0abac77e8f18be0b9aae7a96ef1c49069b71e955b485c4636fa868"
  end

  # Source archives — used only when building from source (--build-from-source).
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.0.7/lazyssh_1.0.7_darwin_arm64.tar.gz"
    sha256 "1ba68f8a8521af09dd4f1aa8cffa590321ca33cf28cbbc732b7e221edbf5a87f"
  elsif OS.mac?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.0.7/lazyssh_1.0.7_darwin_amd64.tar.gz"
    sha256 "cc68559e62ff320c8d695b8add67dfd36b887db6453e6653e85ffdbd73d066f0"
  elsif Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.0.7/lazyssh_1.0.7_linux_arm64.tar.gz"
    sha256 "9dcc9962442d556209ba0a28859c912dd532bb5eee0c7223eae9ded6729c50a9"
  else
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.0.7/lazyssh_1.0.7_linux_amd64.tar.gz"
    sha256 "96238412a001e52d1a9adfc66a59147f4ef965cc79270fd3ab3486eee38babd2"
  end

  def install
    bin.install "lazyssh"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/lazyssh --version")
  end
end
