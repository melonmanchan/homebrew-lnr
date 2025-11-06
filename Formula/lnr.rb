class Lnr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lnr"
  version "0.1.0"
  license "MIT"
  head "https://github.com/melonmanchan/lnr.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.1.0/lnr-macos-arm64.zip"
      sha256 "927b4af17667fc9151881e9ae12732b1744daab06b6e574ab1408484904346f5"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.1.0/lnr-macos-x64.zip"
      sha256 "88bb71567e104c27f648d7fdd39bfc301315000740b430215b75dbafa9106af1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.1.0/lnr-linux-arm64.zip"
      sha256 "6180dff6ec9453e0b018a53ed7b971d62c1e620358d95b25bbc3e4c93e7d1a94"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.1.0/lnr-linux-x64.zip"
      sha256 "e34f54a12b05a7f6ed10c6e9ef0365776bdbcdedd10aea76d3ab6da229b0b376"
    end
  end

  def install
    bin.install "lnr"
  end

  test do
    system "#{bin}/lnr", "--version"
  end
end
