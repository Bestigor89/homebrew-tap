# typed: false
# frozen_string_literal: true

class Lazyssh < Formula
  desc "Keyboard-driven SSH manager and dual-pane SFTP file browser for the terminal"
  homepage "https://github.com/Bestigor89/lazyssh"
  version "1.1.32"
  license "PolyForm-Noncommercial-1.0.0"

  # Prebuilt bottles — brew pours these and skips the Xcode check entirely.
  bottle do
    root_url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.32"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fb5e820262675c49070c4e3caf0729e9a042166527a82d5790b567c1e02b760a"
    sha256 cellar: :any_skip_relocation, sequoia:       "34a501725d79875e48281c361a19e0e6544a3a3f076f54ef8bec3fc67f54339f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "17692b44993a565459e81d62ec4da872da039ee0bdc9996f44b6147cec7fc07f"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "985052f9d45d2355333065a6ff03cd81604fc1e52f4887725f55b6d54c8e51ea"
  end

  # Source archives — used only when building from source (--build-from-source).
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.32/lazyssh_1.1.32_darwin_arm64.tar.gz"
    sha256 "35e95b6ab194cd1aa8684471f5fb4b3f2ae5178d4c0f6158c1a0b2c77e0c8db4"
  elsif OS.mac?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.32/lazyssh_1.1.32_darwin_amd64.tar.gz"
    sha256 "916931c1e847b768188d3ea3ec9075eda1392a986c389654538daddc7bd3b203"
  elsif Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.32/lazyssh_1.1.32_linux_arm64.tar.gz"
    sha256 "ba0a1c197def6eff67287552ebc8cd4f354f15971cc6fdd3c1043a6c334aba40"
  else
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.32/lazyssh_1.1.32_linux_amd64.tar.gz"
    sha256 "87b05d5546d70c5fa385f6c14e9eba58e807c147f7a7f2cf402ee750242dd2c7"
  end

  def install
    bin.install "lazyssh"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/lazyssh --version")
  end
end
