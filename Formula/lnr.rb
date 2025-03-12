class Lnr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lnr"
  version "0.0.7"
  license "MIT"
  head "https://github.com/melonmanchan/lnr.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.7/lnr-macos-arm64.zip"
      sha256 "2cb71c0d8366f6f3ba8be38d5e703145b35ddce8b17527c299afb30d6f7194bf"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.7/lnr-macos-x64.zip"
      sha256 "e535b1b10f5d68184b6c77c358b10a58fb1487afef18f1046025b18baf29fa93"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.7/lnr-linux-arm64.zip"
      sha256 "8f38b1794611a70bf6691baaa8b6ec78bc43bb768890dc1ffb41a5d8038d7f0c"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.7/lnr-linux-x64.zip"
      sha256 "f7a7b8f06d9c6fc129db4deaca124b685c40526de569d12aaf93aa6962d5903b"
    end
  end

  def install
    bin.install "lnr"
  end

  test do
    system "#{bin}/lnr", "--version"
  end
end
