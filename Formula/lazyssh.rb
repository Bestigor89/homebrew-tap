# typed: false
# frozen_string_literal: true

class Lazyssh < Formula
  desc "Keyboard-driven SSH manager and dual-pane SFTP file browser for the terminal"
  homepage "https://github.com/Bestigor89/lazyssh"
  version "1.1.360"
  license "PolyForm-Noncommercial-1.0.0"

  # Prebuilt bottles — brew pours these and skips the Xcode check entirely.
  bottle do
    root_url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.360"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9394abac4035726e88202433e9d574262e687b6060a0dc6a4dee53f8bcf0c813"
    sha256 cellar: :any_skip_relocation, sequoia:       "ed358b5b7406395448497ab153ccf668cb459cfc4da5b8e16b755b078811910a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "4cc49b8650ad754175254185ff22a6bf0263e5d57daf6730c9d86fa89c2b2af4"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "3de862c8cc7ec5d516bc3a08be1f67b91c98b9496967b2d9b16f9afad16dcb35"
  end

  # Source archives — used only when building from source (--build-from-source).
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.360/lazyssh_1.1.360_darwin_arm64.tar.gz"
    sha256 "2c6da820f35dc3ee6cfc4299c001af05d1307bb7e6b0e283c9f375791b5e73dc"
  elsif OS.mac?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.360/lazyssh_1.1.360_darwin_amd64.tar.gz"
    sha256 "933fcf12c851ea0afaf4efba2804a05aa575ff3dca2d8baeb2f6e7942edf2b1d"
  elsif Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.360/lazyssh_1.1.360_linux_arm64.tar.gz"
    sha256 "00609cb22d01134168dffe1a492776cb6341b925ce6107e4f59662248adda9be"
  else
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.360/lazyssh_1.1.360_linux_amd64.tar.gz"
    sha256 "198a8bb1c6118ef8981ca672a78be542a873dcf4e6dec9a9608e5bba741889ca"
  end

  def install
    bin.install "lazyssh"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/lazyssh --version")
  end
end
