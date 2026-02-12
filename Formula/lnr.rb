class Lnr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lnr"
  version "0.3.4"
  license "MIT"

  head do
    url "https://github.com/melonmanchan/lnr.git", branch: "main"
    depends_on "deno" => :build
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.3.4/lnr-macos-arm64.zip"
      sha256 "78d5b4019c429f07f7e916f8c84c16242826851acba6c518613be4d87dbf2df8"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.3.4/lnr-macos-x64.zip"
      sha256 "c6bade87a7158439d76e8a20d33679a6c1752afbd8664a0ca05f9290a422d7e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.3.4/lnr-linux-arm64.zip"
      sha256 "8471ef107d38147d3eb49a15a1bcae12b035a81272c9b17520e7e219cc4f0227"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.3.4/lnr-linux-x64.zip"
      sha256 "a3f6c883d122439f6c1723300c0a0e18d87f1686734c8b989293ce34b6fd1f64"
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
