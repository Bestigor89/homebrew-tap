# typed: false
# frozen_string_literal: true

class Lazyssh < Formula
  desc "Keyboard-driven SSH manager and dual-pane SFTP file browser for the terminal"
  homepage "https://github.com/Bestigor89/lazyssh"
  version "1.0.1"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/Bestigor89/lazyssh/releases/download/v1.0.1/lazyssh_1.0.1_darwin_arm64.tar.gz"
      sha256 "6e1860bf7cf7a324c27469e98d37cd120fc1ca1c05a13f022e6da0b06b100e75"
    end

    on_intel do
      url "https://github.com/Bestigor89/lazyssh/releases/download/v1.0.1/lazyssh_1.0.1_darwin_amd64.tar.gz"
      sha256 "01e3adacb1216eb6f4f152091841d8c7b785a238893e0663db88dbe257a87b13"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Bestigor89/lazyssh/releases/download/v1.0.1/lazyssh_1.0.1_linux_amd64.tar.gz"
      sha256 "6b6be669421dcdefdbc31b53e6379f4d3a8a1f983431eceefb025e8484f7172b"
    end

    on_arm do
      url "https://github.com/Bestigor89/lazyssh/releases/download/v1.0.1/lazyssh_1.0.1_linux_arm64.tar.gz"
      sha256 "1972382f6d4b0c712eb5bc1391c401304e8cb35076f2f3f132359c40fb740454"
    end
  end

  def install
    bin.install "lazyssh"
  end

  test do
    system "#{bin}/lazyssh", "--version"
  end
end
