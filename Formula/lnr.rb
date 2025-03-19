class Lnr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lnr"
  version "0.0.15"
  license "MIT"
  head "https://github.com/melonmanchan/lnr.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.15/lnr-macos-arm64.zip"
      sha256 "a233c9e9d8829219320a1f7e62f913bbd3da041ca7eaa851f2fc9d376d9ce33d"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.15/lnr-macos-x64.zip"
      sha256 "c23bed97e9ac9ac0bc5008c57434d505e03d0cee43ca01bdb4d9d3719d7455e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.15/lnr-linux-arm64.zip"
      sha256 "418bec8c82e1fdc7bdbf32f0b6deac59c53e562fb5fd72ce988c56f94720aa65"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.15/lnr-linux-x64.zip"
      sha256 "effd17bec865bd72796fa5c968d6b1c6906db3377e56af6d2e808469d91b3923"
    end
  end

  def install
    bin.install "lnr"
  end

  test do
    system "#{bin}/lnr", "--version"
  end
end
