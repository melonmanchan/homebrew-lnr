class Lnr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lnr"
  version "0.1.1"
  license "MIT"
  head "https://github.com/melonmanchan/lnr.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.1.1/lnr-macos-arm64.zip"
      sha256 "225760429f65862b157229e1235ca571105a363fdc1d1db712de54d406471b71"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.1.1/lnr-macos-x64.zip"
      sha256 "485770a3e08bf970a536484c5fb66b27f061d98a39bd00293d7c7f7c8d34a018"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.1.1/lnr-linux-arm64.zip"
      sha256 "cf04fb3b028d0ef0b6b471b526ac9ecdc52ec5118aa9f40ff0aaa9fdb25ca18d"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.1.1/lnr-linux-x64.zip"
      sha256 "84cad9ba8f90ee933f6c897ae30e6ae2fecea34e32f8990a1239c95f08503f22"
    end
  end

  def install
    bin.install "lnr"
  end

  test do
    system "#{bin}/lnr", "--version"
  end
end
