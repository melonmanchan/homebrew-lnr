class Lnr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lnr"
  version "0.2.1"
  license "MIT"

  head do
    url "https://github.com/melonmanchan/lnr.git", branch: "main"
    depends_on "deno" => :build
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.2.1/lnr-macos-arm64.zip"
      sha256 "cb91b22d177aeaca12709413b08cf8828e50e9738c5e61484f930cea7aca511d"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.2.1/lnr-macos-x64.zip"
      sha256 "29de41f0a30ac08a7ccf4ef71b6835c6cea8109a277ee424ff7ba0d539f02435"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.2.1/lnr-linux-arm64.zip"
      sha256 "ad9925fb5b6add5c97f7e81c2af85fb46d749e31ebfc283fe9dace23cc776073"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.2.1/lnr-linux-x64.zip"
      sha256 "dbec85c8749ffca2cdae74933345f9bff64506a95769917557c8329797198752"
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
