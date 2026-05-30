# typed: false
# frozen_string_literal: true

class Lazyssh < Formula
  desc "Keyboard-driven SSH manager and dual-pane SFTP file browser for the terminal"
  homepage "https://github.com/Bestigor89/lazyssh"
  version "1.1.31"
  license "PolyForm-Noncommercial-1.0.0"

  # Prebuilt bottles — brew pours these and skips the Xcode check entirely.
  bottle do
    root_url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.31"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fb60c01e7a57dd63936432d37e818e61aeb67cb6f4aa51806ce5180c574cbfad"
    sha256 cellar: :any_skip_relocation, sequoia:       "e4b0acfd87d6996d1efd3b553305385510bd9ecd04b3dbc76fa4ea1618683c8b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "383c784f4043f0640a6c846accc99ca0d3178e2f06553ef414b0401e68652b33"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "8f70aa56c8708820942b7eecccb79eeb69d13eb24288ff2688861f8282dc83e8"
  end

  # Source archives — used only when building from source (--build-from-source).
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.31/lazyssh_1.1.31_darwin_arm64.tar.gz"
    sha256 "816f9b9c4832d64ad15997b402ea68c3a62ce5796db3908e9a9c85882885b1ab"
  elsif OS.mac?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.31/lazyssh_1.1.31_darwin_amd64.tar.gz"
    sha256 "2b65358746a8f01f72ca4595816cb3f4f88e542ba4726b7cafccd849d8bc91a7"
  elsif Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.31/lazyssh_1.1.31_linux_arm64.tar.gz"
    sha256 "92895b63b0508e5affa97b6d038133280fbab676f7a0c1d2cb4fe8905a340991"
  else
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.31/lazyssh_1.1.31_linux_amd64.tar.gz"
    sha256 "5b37987d58fbff618060bc916d4ef7392d2e0dc9c2d58c589555ad507375d791"
  end

  def install
    bin.install "lazyssh"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/lazyssh --version")
  end
end
