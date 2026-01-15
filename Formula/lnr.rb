class Lnr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lnr"
  version "0.3.0"
  license "MIT"

  head do
    url "https://github.com/melonmanchan/lnr.git", branch: "main"
    depends_on "deno" => :build
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.3.0/lnr-macos-arm64.zip"
      sha256 "1638fb41742240569a92842c247ca4146b4e2165baed18470a8e4d4030f07c63"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.3.0/lnr-macos-x64.zip"
      sha256 "708566fe34f99f92c30dacad09a18d4b1107b7c341cf6267960066861a97cf3a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.3.0/lnr-linux-arm64.zip"
      sha256 "34192d995340a03d4d6b95ba528976c61ec76e1357c93409b41743d00ac245a6"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.3.0/lnr-linux-x64.zip"
      sha256 "21480df4ebb61af23c0992b79d98a06594d14a575f642f78fdc1b7ffdd7cb143"
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
