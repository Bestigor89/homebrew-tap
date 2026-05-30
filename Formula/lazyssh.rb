# typed: false
# frozen_string_literal: true

class Lazyssh < Formula
  desc "Keyboard-driven SSH manager and dual-pane SFTP file browser for the terminal"
  homepage "https://github.com/Bestigor89/lazyssh"
  version "1.1.33"
  license "PolyForm-Noncommercial-1.0.0"

  # Prebuilt bottles — brew pours these and skips the Xcode check entirely.
  bottle do
    root_url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.33"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "62df72a11628c973e1591ab29452f3b1cd2f7adab1ee38b8bf917a55482d2af3"
    sha256 cellar: :any_skip_relocation, sequoia:       "21412625db688bb0fa9f76658c8c4b926b4549c96f31dd86fca48740d610cc6d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "cce58bbd02bc3a3847c9457885a62b2c3931e3f190feaae5a45a8bea834ca243"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "fb351b91593b60229117333e5f5fdb85de6be98bdb5a525ae62d60411ca5f839"
  end

  # Source archives — used only when building from source (--build-from-source).
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.33/lazyssh_1.1.33_darwin_arm64.tar.gz"
    sha256 "5659f73e321a0e52bcfdb798db68bec8c14329b4b40b49e0e6c56854e51073f4"
  elsif OS.mac?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.33/lazyssh_1.1.33_darwin_amd64.tar.gz"
    sha256 "8b4d00c0dd0090f938d596cea8dc10d5c1fa3296e247df7e1377725c1363c22e"
  elsif Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.33/lazyssh_1.1.33_linux_arm64.tar.gz"
    sha256 "01535919c73397ce0de3d5d73b5660d6ca3ca84ecbf83f3f924528f88833e6d4"
  else
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.33/lazyssh_1.1.33_linux_amd64.tar.gz"
    sha256 "d0ab38d623618a3fb332e33abbc7901fac445630ff2524e0bf929249d465968f"
  end

  def install
    bin.install "lazyssh"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/lazyssh --version")
  end
end
