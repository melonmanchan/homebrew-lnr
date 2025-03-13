class Lnr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lnr"
  version "0.0.8"
  license "MIT"
  head "https://github.com/melonmanchan/lnr.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.8/lnr-macos-arm64.zip"
      sha256 "df1adcaf90c8d57a33bf371bf26fd537f14a5c31f8277881b56de2abf72ad3f0"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.8/lnr-macos-x64.zip"
      sha256 "34b4234bdfd338b263cd29f899c7b3be50aac45d9bc763da599e90c8bb0ec366"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.8/lnr-linux-arm64.zip"
      sha256 "1a407ba00d9d0987a2762774019395c889178e0c1b6bfe61c8ef3000deb90ad9"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.8/lnr-linux-x64.zip"
      sha256 "8542d48eb507f67b92675edc91ee447c0d6c1cea90de999c832281ac23371d9f"
    end
  end

  def install
    bin.install "lnr"
  end

  test do
    system "#{bin}/lnr", "--version"
  end
end
