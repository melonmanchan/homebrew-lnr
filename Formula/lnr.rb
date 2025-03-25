class Lnr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lnr"
  version "0.0.18"
  license "MIT"
  head "https://github.com/melonmanchan/lnr.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.18/lnr-macos-arm64.zip"
      sha256 "34e093580fee0da3441b98478452fc87ae281d765a2f8985cd97b2a0a6ac2ff6"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.18/lnr-macos-x64.zip"
      sha256 "788a515b73602a11f633a3c1e1e7b066c632f37aaa7d6375fb1d6c30eec9bbd6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.18/lnr-linux-arm64.zip"
      sha256 "7022a9b51667ab48ab7ffddc09c94d5ac92ae44c2c194c41833bdd02ba33016f"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.18/lnr-linux-x64.zip"
      sha256 "6e1e085a8c7f13ea87657d89987439fdb8f746de82acddceba808b2ef04514ee"
    end
  end

  def install
    bin.install "lnr"
  end

  test do
    system "#{bin}/lnr", "--version"
  end
end
