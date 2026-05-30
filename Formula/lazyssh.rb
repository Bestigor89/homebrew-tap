# typed: false
# frozen_string_literal: true

class Lazyssh < Formula
  desc "Keyboard-driven SSH manager and dual-pane SFTP file browser for the terminal"
  homepage "https://github.com/Bestigor89/lazyssh"
  version "1.1.2"
  license "PolyForm-Noncommercial-1.0.0"

  # Prebuilt bottles — brew pours these and skips the Xcode check entirely.
  bottle do
    root_url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fa7b3d4f9267c005ace82a32019d4aeadd820f818b83d636e6666297926cac9f"
    sha256 cellar: :any_skip_relocation, sequoia:       "5d3569947b297c714843354d20d3421ad5ceef54df28d7a9e5c17a588dc4d42d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3551d4e37308830018e6f5785e9a384470c265a2dacf3eaf59b601b1a4718db8"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "55cdd4f1e841bbc9b109ada79178266a395a59db3b2f16ed7d08e28c58535e09"
  end

  # Source archives — used only when building from source (--build-from-source).
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.2/lazyssh_1.1.2_darwin_arm64.tar.gz"
    sha256 "4ab41ca0924598e25d2ec4e7c2fce736267ee5f748165d15e0a501d5aa2eda55"
  elsif OS.mac?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.2/lazyssh_1.1.2_darwin_amd64.tar.gz"
    sha256 "30a33e0fe3b26018f092043a614e8d63d6635871a1a65129e6e085ab0bf5d4f1"
  elsif Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.2/lazyssh_1.1.2_linux_arm64.tar.gz"
    sha256 "4688fea8617527b46d9a2085223cb4832109618bb16933e7a6afb2416320b4a2"
  else
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.2/lazyssh_1.1.2_linux_amd64.tar.gz"
    sha256 "5247e51346c2616f60a7c7443cea9a7179bb58a3c8097b061d2233bf44257a81"
  end

  def install
    bin.install "lazyssh"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/lazyssh --version")
  end
end
