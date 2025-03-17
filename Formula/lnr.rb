class Lnr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lnr"
  version "0.0.14"
  license "MIT"
  head "https://github.com/melonmanchan/lnr.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.14/lnr-macos-arm64.zip"
      sha256 "b2529e9a822e0837ee57f040602985b49934d7d93fc6d50170d4b077f6b9e216"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.14/lnr-macos-x64.zip"
      sha256 "21843a3eb8496978d6859788e18fa29bfed70c4b7dc09d5b1657522c67b7a9b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.14/lnr-linux-arm64.zip"
      sha256 "d2a222bbcf26979e6fe87129e135d80b22415d6ff82868584893b8cab426d6c8"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.14/lnr-linux-x64.zip"
      sha256 "44f73de6fe4cd6c5fba95ef368f2e69f863ad6b60466ee644db4282886e60812"
    end
  end

  def install
    bin.install "lnr"
  end

  test do
    system "#{bin}/lnr", "--version"
  end
end
