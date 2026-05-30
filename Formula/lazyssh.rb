# typed: false
# frozen_string_literal: true

class Lazyssh < Formula
  desc "Keyboard-driven SSH manager and dual-pane SFTP file browser for the terminal"
  homepage "https://github.com/Bestigor89/lazyssh"
  version "1.0.2"
  license "PolyForm-Noncommercial-1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/Bestigor89/lazyssh/releases/download/v1.0.2/lazyssh_1.0.2_darwin_arm64.tar.gz"
      sha256 "fedd130af2e579dcf4051ba649152bfedb9fda0f8f7fbdbeb5109e0b5ab024c1"
    end

    on_intel do
      url "https://github.com/Bestigor89/lazyssh/releases/download/v1.0.2/lazyssh_1.0.2_darwin_amd64.tar.gz"
      sha256 "471d4a210a0c95720353e32549b9009cce42782762050acdf2748f691cae77fd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Bestigor89/lazyssh/releases/download/v1.0.2/lazyssh_1.0.2_linux_amd64.tar.gz"
      sha256 "67b1aa3758ebb15328193d184b872c284f70c6173b1eda73e30bfebc76270c6e"
    end

    on_arm do
      url "https://github.com/Bestigor89/lazyssh/releases/download/v1.0.2/lazyssh_1.0.2_linux_arm64.tar.gz"
      sha256 "43f8c92bdd5fb2fb5478e839756df239ea4b5ad057abdc2180adeab308e746bc"
    end
  end

  def install
    bin.install "lazyssh"
  end

  test do
    system "#{bin}/lazyssh", "--version"
  end
end
