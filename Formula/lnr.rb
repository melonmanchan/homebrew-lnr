class Lnr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lnr"
  version "0.2.0"
  license "MIT"

  head do
    url "https://github.com/melonmanchan/lnr.git", branch: "main"
    depends_on "deno" => :build
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.2.0/lnr-macos-arm64.zip"
      sha256 "1d067c81e28dd62cb14cb525254744eff8ead476428b40a136a966586a7c77cc"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.2.0/lnr-macos-x64.zip"
      sha256 "08faa76ca3bc94d6a5801746e74d3a8a9f327efb183227dbef84ff03e2d44bb7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.2.0/lnr-linux-arm64.zip"
      sha256 "9e8c89bf103afc026b79ca823ca4a6eb138bf4e0f3b7d527448babe870ad0230"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.2.0/lnr-linux-x64.zip"
      sha256 "5eccbfbc47eb0a3e139399eb472c4d0d79f10f7725a260deb1e46c693bb95210"
    end
  end

  def install
    if build.head?
      system "deno", "install"

      if OS.mac?
        if Hardware::CPU.arm?
          system "deno", "task", "compile:macos-arm64"
          bin.install "lnr-macos-arm64/lnr" => "lnr"
        else
          system "deno", "task", "compile:macos-x64"
          bin.install "lnr-macos-x64/lnr" => "lnr"
        end
      else # Linux
        if Hardware::CPU.arm?
          system "deno", "task", "compile:linux-arm64"
          bin.install "lnr-linux-arm64/lnr" => "lnr"
        else
          system "deno", "task", "compile:linux-x64"
          bin.install "lnr-linux-x64/lnr" => "lnr"
        end
      end
    else
      bin.install "lnr"
    end
  end

  test do
    system "#{bin}/lnr", "--version"
  end
end
