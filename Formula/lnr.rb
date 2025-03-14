class Lnr < Formula
  desc "Linear CLI tool"
  homepage "https://github.com/melonmanchan/lnr"
  version "0.0.9"
  license "MIT"
  head "https://github.com/melonmanchan/lnr.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.9/lnr-macos-arm64.zip"
      sha256 "99976cc50b4b2221324fef11b334bb239b83740fd93a31802892b664d35e4ff2"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.9/lnr-macos-x64.zip"
      sha256 "9648f5117de52b46ffa1aedfb98530dda8306943bb613cd9f711fd74e064f3e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.9/lnr-linux-arm64.zip"
      sha256 "7af05af877b8858b6141bf2caa1d0fb092cf4684654db91e9fd6512ff0aa63f3"
    else
      url "https://github.com/melonmanchan/lnr/releases/download/v0.0.9/lnr-linux-x64.zip"
      sha256 "8b907486d22783642036ca519c991629134723c881d84c4f44dbdac2319cab8d"
    end
  end

  def install
    bin.install "lnr"
  end

  test do
    system "#{bin}/lnr", "--version"
  end
end
