class Lnr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lnr"
  version "0.0.12"
  license "MIT"
  head "https://github.com/melonmanchan/lnr.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.12/lnr-macos-arm64.zip"
      sha256 "437cc0c1ce1b1e308a3fb60ef7767ed38596815ba89d8aaf5db8196c4b400992"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.12/lnr-macos-x64.zip"
      sha256 "e08a4810a326a5caaa7c5cec78a2a1f773d0899d112885522014fb3e4169b23f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.12/lnr-linux-arm64.zip"
      sha256 "edd6740c5444a82c8cd385194686c94ff3d9e67e41cd1be6d86b6ed588926e81"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.12/lnr-linux-x64.zip"
      sha256 "8a85b98364b8b2c53c3ca46f6825929de9acc9f69dc52e4e8b00f4e45575b65d"
    end
  end

  def install
    bin.install "lnr"
  end

  test do
    system "#{bin}/lnr", "--version"
  end
end
