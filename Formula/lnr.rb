class Lnr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lnr"
  version "0.0.13"
  license "MIT"
  head "https://github.com/melonmanchan/lnr.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.13/lnr-macos-arm64.zip"
      sha256 "3394352e015e9221495afb3ab42ac3d9ec7392986e9699cac894213829f93d67"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.13/lnr-macos-x64.zip"
      sha256 "9d4e17df61e338ca2b623ba560d28f544167b7bd1dbc6891fffa2831d33d9fe7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.13/lnr-linux-arm64.zip"
      sha256 "64f6e1109731420f7f8b4cca44c8212dd474907442c95757ea922ceeca0c2def"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.13/lnr-linux-x64.zip"
      sha256 "400b51aff951f924ccc3135e01d8b29570fe5ac40d0e1d932bf372286b620ada"
    end
  end

  def install
    bin.install "lnr"
  end

  test do
    system "#{bin}/lnr", "--version"
  end
end
