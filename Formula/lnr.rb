class Lnr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lnr"
  version "0.0.6"
  license "MIT"
  head "https://github.com/melonmanchan/lnr.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.6/lnr-macos-arm64.zip"
      sha256 "67f947cb2e7af5c37257cced1e05d992be0f9c68133ccd2c984513b9ee8c2056"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.6/lnr-macos-x64.zip"
      sha256 "e7d127b6910c7b4ae1bc7eed858f6188c912b224ed7b8e6092b3abbe3b9b9dd6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.6/lnr-linux-arm64.zip"
      sha256 "29e67e57f34b6fa5e132fab3f5eb206445cb68ab8bcc530edb53d6fd66d93a4e"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.6/lnr-linux-x64.zip"
      sha256 "f70e1088aab74f83cfb1af821b83c6acac5161f9c7ddcdc852354c93b0575d78"
    end
  end

  def install
    bin.install "lnr"
  end

  test do
    system "#{bin}/lnr", "--version"
  end
end
