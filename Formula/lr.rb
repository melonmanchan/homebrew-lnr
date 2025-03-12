class Lr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lr"
  version "0.0.5"
  license "MIT"
  head "https://github.com/melonmanchan/lr.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lr/releases/download/v0.0.5/lr-macos-arm64.zip"
      sha256 "ee56834c411877e150f1bf6382032d0ddac6e91c55d2080304cbc28a5358221d"
    else
      url "https://github.com/melonmanchan/lr/releases/download/v0.0.5/lr-macos-x64.zip"
      sha256 "ac0994a67903c34ad8631e1f9540de46777b892fe7782372b5e9d8d61497f170"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lr/releases/download/v0.0.5/lr-linux-arm64.zip"
      sha256 "cd6a4a5262a41f99367d6dfc8ae087adcf5e1ccaf5887cf90612078028e7f037"
    else
      url "https://github.com/melonmanchan/lr/releases/download/v0.0.5/lr-linux-x64.zip"
      sha256 "4adf7a7f08c64f0c5473e76a11d5a1516cce427c0ec6333335f90ea9be3d86b4"
    end
  end

  def install
    bin.install "lr"
  end

  test do
    system "#{bin}/lr", "--version"
  end
end
