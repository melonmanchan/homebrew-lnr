class Lnr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lnr"
  version "0.3.3"
  license "MIT"

  head do
    url "https://github.com/melonmanchan/lnr.git", branch: "main"
    depends_on "deno" => :build
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.3.3/lnr-macos-arm64.zip"
      sha256 "baf7b0984f60814aa765d77e8e87ae9bc36666366d5708952e1650289aea3b6c"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.3.3/lnr-macos-x64.zip"
      sha256 "262aecdc4d0708b1f2b2c689690ce21ceb02414770976448e3eb051ca1124092"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.3.3/lnr-linux-arm64.zip"
      sha256 "d1c77f4f089642f0352f63349aed80974ef05b4d9be597e3b3e983da110aca40"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.3.3/lnr-linux-x64.zip"
      sha256 "4f270f0bbda904e1fa1cbd81cd4d77195ccb41b4199d5e8d3e7559e081b36250"
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
