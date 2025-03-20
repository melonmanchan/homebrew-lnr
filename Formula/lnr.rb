class Lnr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lnr"
  version "0.0.17"
  license "MIT"
  head "https://github.com/melonmanchan/lnr.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.17/lnr-macos-arm64.zip"
      sha256 "6f65baf56df5283d05e4d253ded572387b82b2cf264a5eb30f4fd727d6f581ea"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.17/lnr-macos-x64.zip"
      sha256 "2925098d2812825ca56389109a53c3bc2bad99622b94b72cb87088f60639c253"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.17/lnr-linux-arm64.zip"
      sha256 "57977b14745c4e3aaebd3c6bca4237d59af385565e406cc653711de9321ffb09"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.17/lnr-linux-x64.zip"
      sha256 "129d17369e0bb3b20d422978dba8026b143440bc6534126fe1bac01fe34bda2d"
    end
  end

  def install
    bin.install "lnr"
  end

  test do
    system "#{bin}/lnr", "--version"
  end
end
