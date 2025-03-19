class Lnr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lnr"
  version "0.0.16"
  license "MIT"
  head "https://github.com/melonmanchan/lnr.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.16/lnr-macos-arm64.zip"
      sha256 "244bcf3f452e0d0d5a3ea9eaf3e89176bc642dda9fe4758bf61a1806d6744df9"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.16/lnr-macos-x64.zip"
      sha256 "99d6329b8f91f39f8c96116c4836dac80472147384d454edd58ca1ec17760eb4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.16/lnr-linux-arm64.zip"
      sha256 "d5625b0d99c3652df087daa9313f378aae9d78d654e718f0163afda614d8ae28"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.16/lnr-linux-x64.zip"
      sha256 "79941ed8fcefe99d51decd7138c2ccf40fc6f33b0b0ad5dac453edc4f93ab734"
    end
  end

  def install
    bin.install "lnr"
  end

  test do
    system "#{bin}/lnr", "--version"
  end
end
