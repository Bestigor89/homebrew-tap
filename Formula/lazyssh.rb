# typed: false
# frozen_string_literal: true

class Lazyssh < Formula
  desc "Keyboard-driven SSH manager and dual-pane SFTP file browser for the terminal"
  homepage "https://github.com/Bestigor89/lazyssh"
  version "1.1.3"
  license "PolyForm-Noncommercial-1.0.0"

  # Prebuilt bottles — brew pours these and skips the Xcode check entirely.
  bottle do
    root_url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e694a62b6ee53dc77a492176cec09eabd4240aac6f6ae0636858d17ae73ac707"
    sha256 cellar: :any_skip_relocation, sequoia:       "ab5b45816f67f17308d66020597c9372f05b17096c1dd6535fe52f0e783c431b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "7b6740671e6c876848c19b5518e0b1515b0ee86be55351c0e45187ca99a7de44"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "250ab15da20969fb8d12b1e9da31b9565cb72714b64e36ad832490e26f452779"
  end

  # Source archives — used only when building from source (--build-from-source).
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.3/lazyssh_1.1.3_darwin_arm64.tar.gz"
    sha256 "594998f17d07d86f1d7fa255a4ef17c89fd18e54a7df1d2a094afa2d2d6d1e3b"
  elsif OS.mac?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.3/lazyssh_1.1.3_darwin_amd64.tar.gz"
    sha256 "1e4f2796ce8ecd901a96f493bd0ba6e287150b576b0b035b87fccfaadb992c14"
  elsif Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.3/lazyssh_1.1.3_linux_arm64.tar.gz"
    sha256 "fa0f74fc61a43fe2a82ad3ba7f7420b16f1b24c1e37baed2fee26f0e61971ef2"
  else
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.3/lazyssh_1.1.3_linux_amd64.tar.gz"
    sha256 "e383ff2a57dfe3cb4ce0d9f070b8fe68b574e4eb7e9d9ad0a4e5523dc309f12f"
  end

  def install
    bin.install "lazyssh"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/lazyssh --version")
  end
end
