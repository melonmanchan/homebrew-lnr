class Lr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lr"
  version "0.0.4"
  license "MIT"
  head "https://github.com/melonmanchan/lr.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lr/releases/download/v0.0.4/lr-macos-arm64.zip"
      sha256 "3d58c5069312807930414c9762f20e28c2f7e4a7a321f2c65fd170c57c0b28e3"
    else
      url "https://github.com/melonmanchan/lr/releases/download/v0.0.4/lr-macos-x64.zip"
      sha256 "9769d4fa160298250d56cb4b88feb5a6fcbe918d7a03c6fbd32b96a9950cf5cc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lr/releases/download/v0.0.4/lr-linux-arm64.zip"
      sha256 "aac03e9c697bf6352f7760e2ab61a3b942b122f02f30943d6f44dd131a845856"
    else
      url "https://github.com/melonmanchan/lr/releases/download/v0.0.4/lr-linux-x64.zip"
      sha256 "bf869f9864e87acf1623277dd22aa5eac974ed87dae8edced2798ddea4cf91c5"
    end
  end

  def install
    bin.install "lr"
  end

  test do
    system "#{bin}/lr", "--version"
  end
end
