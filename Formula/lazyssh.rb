# typed: false
# frozen_string_literal: true

class Lazyssh < Formula
  desc "Keyboard-driven SSH manager and dual-pane SFTP file browser for the terminal"
  homepage "https://github.com/Bestigor89/lazyssh"
  version "1.0.4"
  license "PolyForm-Noncommercial-1.0.0"

  # Prebuilt bottles — brew pours these and skips the Xcode check entirely.
  bottle do
    root_url "https://github.com/Bestigor89/lazyssh/releases/download/v1.0.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3a93e6a9d33536be50b11c8752a2794d56b16b14d8fbbf89e20dd8a9c6104153"
    sha256 cellar: :any_skip_relocation, sequoia:       "f48f2d6db52032eb90eab770955fcfc9a56294e2ba34807b3c4babcdf7372c7b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ca3ace4d65671bd9b0c86e95e7a43a113770d33db7c07f3440899e71eb19feb6"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "74eb7b310857e21656d0fcac6b3f518beeb3edc242d2d59d5226ebc015eacee6"
  end

  # Source archives — used only when building from source (--build-from-source).
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.0.4/lazyssh_1.0.4_darwin_arm64.tar.gz"
    sha256 "d81cfdaf0d4b90eb8a52f40752b4a1a4b25820b059bf2819c07e860fece57c43"
  elsif OS.mac?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.0.4/lazyssh_1.0.4_darwin_amd64.tar.gz"
    sha256 "e6186f63c578ca4c983ed47e110ad65a420fc6bcb254053e337442c71437a126"
  elsif Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.0.4/lazyssh_1.0.4_linux_arm64.tar.gz"
    sha256 "930892d11360736b98aadf5e3687d089255aca1b471e0d64125b62e03a5d22de"
  else
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.0.4/lazyssh_1.0.4_linux_amd64.tar.gz"
    sha256 "df51ecf32ac2fe7fb3693e7392d5fb3c025836e4c03082be29249b62890250c0"
  end

  def install
    bin.install "lazyssh"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/lazyssh --version")
  end
end
