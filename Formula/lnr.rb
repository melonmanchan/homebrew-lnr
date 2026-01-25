class Lnr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lnr"
  version "0.3.1"
  license "MIT"

  head do
    url "https://github.com/melonmanchan/lnr.git", branch: "main"
    depends_on "deno" => :build
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.3.1/lnr-macos-arm64.zip"
      sha256 "958385c421050704f88a8eb404ddefcbce6684f2b2896587d1d16627a7211af1"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.3.1/lnr-macos-x64.zip"
      sha256 "55699339743070e08f060c73dd358cb41cb8642de49e6970c6aa70fc45651796"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.3.1/lnr-linux-arm64.zip"
      sha256 "36f712a5edcb1a3cfc1c39804c1d670bc68d41b08e25c9b13ccb0deda580f8c7"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.3.1/lnr-linux-x64.zip"
      sha256 "7050c2a00578c645368c9a0714859507053e83cc90b7e7cf7ba27f1f9480e2e3"
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
