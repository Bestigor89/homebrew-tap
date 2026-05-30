# typed: false
# frozen_string_literal: true

class Lazyssh < Formula
  desc "Keyboard-driven SSH manager and dual-pane SFTP file browser for the terminal"
  homepage "https://github.com/Bestigor89/lazyssh"
  version "1.1.34"
  license "PolyForm-Noncommercial-1.0.0"

  # Prebuilt bottles — brew pours these and skips the Xcode check entirely.
  bottle do
    root_url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.34"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6167c17ae78117713c689555aea33352b9f2995518b2a1c16a2ec2b1d1040543"
    sha256 cellar: :any_skip_relocation, sequoia:       "966c0e3ae9f64535ae248af41b7eccbc85c101d016cd307e8f9ab85c7ebc5ffb"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "06474603f4a963a32db8a06f82f0c9cdb0e07560452b9ff803d8886d690aa132"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "d6eba9c9bb1bb7cf464018675da928a9c64fe5e4a15496a10eb639b12df565af"
  end

  # Source archives — used only when building from source (--build-from-source).
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.34/lazyssh_1.1.34_darwin_arm64.tar.gz"
    sha256 "309d7117844e55b44209783d2b8fb19d54dc486e7825ea2c56a455c581097411"
  elsif OS.mac?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.34/lazyssh_1.1.34_darwin_amd64.tar.gz"
    sha256 "68e8ae90306697c2aba0ef3d89ed8bf76750013bd79b9c729245446243cb19e7"
  elsif Hardware::CPU.arm?
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.34/lazyssh_1.1.34_linux_arm64.tar.gz"
    sha256 "20eb1d58e5b1170f382bcd83c02f6e90774b15667cea208491772f11696fd171"
  else
    url "https://github.com/Bestigor89/lazyssh/releases/download/v1.1.34/lazyssh_1.1.34_linux_amd64.tar.gz"
    sha256 "52a2e24e752bb7454c191591c52b1e971d99cdf3edef9de2e08226ded55ea761"
  end

  def install
    bin.install "lazyssh"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/lazyssh --version")
  end
end
