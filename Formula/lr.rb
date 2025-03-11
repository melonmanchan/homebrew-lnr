class Lr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lr"
  head "https://github.com/melonmanchan/lr.git", branch: "main"
  version "0.0.4"
  license "MIT"
  
  if Hardware::CPU.arm?
    url "https://github.com/melonmanchan/lr/releases/download/v0.0.4/lr-macos-arm64.zip"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  else
    url "https://github.com/melonmanchan/lr/releases/download/v0.0.4/lr-macos-x64.zip"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
