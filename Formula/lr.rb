class Lr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lr"
  head "https://github.com/melonmanchan/lr.git", branch: "main"
  version "0.0.4"
  license "MIT"
  
  if Hardware::CPU.arm?
    url "https://github.com/melonmanchan/lr/releases/download/v0.0.4/lr-macos-arm64.zip"
    sha256 "3d58c5069312807930414c9762f20e28c2f7e4a7a321f2c65fd170c57c0b28e3"
  else
    url "https://github.com/melonmanchan/lr/releases/download/v0.0.4/lr-macos-x64.zip"
    sha256 "9769d4fa160298250d56cb4b88feb5a6fcbe918d7a03c6fbd32b96a9950cf5cc"
  end

  def install
    bin.install "lr"
  end

  test do
    system "#{bin}/lr --version"
  end
end
