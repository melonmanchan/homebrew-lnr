class Lr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lr"
  head "https://github.com/melonmanchan/lr.git", branch: "main"
  version "0.0.3"
  license "MIT"
  
  if Hardware::CPU.arm?
    url "https://github.com/melonmanchan/lr/releases/download/v0.0.3/lr-macos-arm64.zip"
    sha256 "8e6defca1832156dc210281ec1ad252fbf61fd5d0d77c8cbc8819535026657f9"
  else
    url "https://github.com/melonmanchan/lr/releases/download/v0.0.3/lr-macos-x64.zip"
    sha256 "bdc4e2be977f227f9a1d70f5cfad9ea48131e6d5ba1a26fd2e5e114ce159e86f"
  end

  def install
    if Hardware::CPU.arm?
      bin.install "lr-macos-arm64/lr"
    else
      bin.install "lr-macos-x64/lr"
    end
  end

  test do
    system "#{bin}/lr --version"
  end
end
